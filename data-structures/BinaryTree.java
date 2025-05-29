public class BinaryTree {
    public  Node root;

    public BinaryTree() {
        root = null;
    }

    private class Node {
        int data;
        Node left, right;

        private Node(int item) {
            data = item;
            left = right = null;
        }
    }

    public void insert(int data) {

    }

    int countNodes(Node root) {
        if (root == null) {
            return 0;
        } else {
            int count = 1;
            count += countNodes(root.left);
            return count;
        }
    }

    public static void main(String args[]) {
        BinaryTree tree = new BinaryTree();
        tree.countNodes(tree.root);


    }
}
