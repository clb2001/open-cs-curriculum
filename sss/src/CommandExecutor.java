import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;

public class CommandExecutor {
    public static @NotNull String execute(@NotNull People p, @Nullable String content)
    {
        if (content == null)
        {
            System.out.println("Invalid Command");
            return "error";
        }
        if (content.equals("name")) {
            System.out.println(p.getName());
        }
        return "null";
    }
}
