import git
import unittest
from git_branch_registry import (
    create_register,
    display_path_info,
    get_branch_name,
    get_head_hash,
    get_root_repo,
    get_root_path,
    is_git_repo,
    is_submodule,
)


class TestBranchRegistry(unittest.TestCase):
    def setUp(self):
        self.sub_path = "/home/user/root/modules/repo/test"
        self.sub_root = "/home/user/root/modules/repo"
        self.root_path = "/home/user/root/modules"
        self.root_root = "/home/user/root"
        self.error_path = "/home/user"

        self.sub_repo = git.Repo(self.sub_root)
        self.root_repo = git.Repo(self.root_root)

    def test_info(self):
        print("")
        display_path_info(self.sub_path)
        display_path_info(self.sub_root)
        display_path_info(self.root_path)
        display_path_info(self.root_root)
        print("")

    def test_is_git_repo(self):
        self.assertTrue(is_git_repo(self.sub_path))
        self.assertTrue(is_git_repo(self.sub_root))
        self.assertTrue(is_git_repo(self.root_path))
        self.assertTrue(is_git_repo(self.root_root))
        self.assertFalse(is_git_repo(self.error_path))

    def test_is_submodule(self):
        self.assertTrue(is_submodule(self.sub_path))
        self.assertTrue(is_submodule(self.sub_root))
        self.assertFalse(is_submodule(self.root_path))
        self.assertFalse(is_submodule(self.root_root))

    def test_get_branch_name(self):
        print("")
        print("sub  : " + get_branch_name(self.sub_repo))
        print("root : " + get_branch_name(self.root_repo))

    def test_get_head_hash(self):
        print("")
        print("sub  : " + get_head_hash(self.sub_repo))
        print("root : " + get_head_hash(self.root_repo))

    def test_get_root_path(self):
        self.assertEqual(get_root_path(self.sub_repo), self.root_root)
        self.assertEqual(get_root_path(self.root_repo), self.root_root)

    def test_get_root_repo(self):
        self.assertEqual(get_root_repo(self.sub_repo), self.root_repo)
        self.assertEqual(get_root_repo(self.root_repo), self.root_repo)

    def test_create_register(self):
        create_register(self.sub_path)


if __name__ == "__main__":
    unittest.main()
