#!/usr/bin/env python
import argparse
import git
import os
import sys


def is_git_repo(path):
    try:
        _ = git.Repo(path, search_parent_directories=True).git_dir
        return True
    except git.exc.InvalidGitRepositoryError:
        return False


def is_submodule(path):
    assert is_git_repo(path)
    repo = git.Repo(path, search_parent_directories=True)
    git_dir = repo.git.rev_parse("--git-dir")
    return git_dir.find(".git/modules/") >= 0


def get_branch_name(repo):
    branch = repo.head.reference
    return branch.name


def get_head_hash(repo):
    commit = repo.head.commit
    return commit.hexsha


def get_root_path(repo):
    if not is_submodule(repo.working_tree_dir):
        return repo.working_tree_dir
    git_dir = repo.git.rev_parse("--git-dir")
    root_path = git_dir[0 : git_dir.find(".git/modules/") - 1]
    return root_path


def get_root_repo(repo):
    if not is_submodule(repo.working_tree_dir):
        return repo
    return git.Repo(get_root_path(repo))


def display_path_info(path):
    assert is_git_repo(path)
    repo = git.Repo(path, search_parent_directories=True)
    print("path\t\t: " + path)
    print("working_tree_dir: " + repo.working_tree_dir)
    print("git-dir\t\t: " + repo.git.rev_parse("--git-dir"))
    print("--")


def create_register(path):
    assert is_git_repo(path)
    display_path_info(path)

    # current repository
    curr_repo = git.Repo(path, search_parent_directories=True)
    assert not curr_repo.bare

    root_repo = get_root_repo(curr_repo)
    assert not root_repo.bare

    project_name = os.path.basename(root_repo.working_tree_dir)
    print("project_name: " + project_name)

    print(project_name + " " + get_head_hash(root_repo))
    for sm in root_repo.submodules:
        print(sm.hexsha + " " + sm.name)
        # is init?


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Store and restore branches of a git repository and submodules."
    )
    parser.add_argument("store", help="store repository status")
    args = parser.parse_args()

    cwd = os.getcwd()

    assert is_git_repo(cwd), "Current directory is not in a git repository: " + cwd

    if args.store:
        create_register(cwd)
    else:
        print("Unknown option")
