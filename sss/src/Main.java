import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws IOException, UnsupportedFlavorException {
        Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        Transferable clipTf = clipboard.getContents(null);
        if (clipTf != null)
        {
            if (clipTf.isDataFlavorSupported(DataFlavor.stringFlavor))
            {
                String str = (String) clipTf.getTransferData(DataFlavor.stringFlavor);
                System.out.println(str);
            }
        }
    }
}