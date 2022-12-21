#! /bin/bash

# Create directory
# Create X number of files by default 6
# Codechef/Atcoder/Codeforces/Kickstart/Codejam

Help () {
    echo "Generate Java CP template files"
    echo "options:"
    echo "c Contest Type"
    echo "  [CC] Codechef"
    echo "  [AC] Atcoder"
    echo "  [CF] Codeforces"
    echo "d Directory Path"
    echo "q Number of questions"
}

# Initialize arguments
while getopts d:c:q:hvi flag
do
    case "${flag}" in
        d) DIR_PATH=${OPTARG};;
        c) CONTEST=${OPTARG};;
        q) QUESTIONS=${OPTARG};;
        h) Help
           exit;;
        v) OPEN_IN_VSCODE="TRUE";;
        i) OPEN_IN_INTELLIJ="TRUE";;
    esac
done

CreateDirectory () {
    if [ -z ${DIR_PATH} ]; then
        DIR_PATH="CP"
    fi
    `mkdir "${DIR_PATH}"`
    if [ $? -ne 0 ]; then
        echo "Directory already exists! Do you want to remove existing directory (enter y/n)?"
        local option=""
        read option
        if [ "${option}" == "y" ]; then
            echo "Removing existing directory ${DIR_PATH}"
            `rm -rf $DIR_PATH`
            if [ $? -ne 0 ]; then
                echo "Cannot remove directory ${DIR_PATH}"
                return 1
            fi
            # TRY AGAIN
            `mkdir "/${DIR_PATH}"`
            if [ $? -ne 0 ]; then
                echo "Operation Failed! Try again later."
                return 1
            fi
        else
            echo "Exiting!"
            return 1
        fi
    fi
    echo "Generated Directory ${DIR_PATH}"
}

GenerateFile () {
    local item=$1
    local fileName=$2
    if [ -z ${CONTEST} ]; then
        CONTEST="CF"
    fi
    local filePath="${DIR_PATH}/${fileName}"
    if [ "$CONTEST" == "CF" ]; then
    cat > "$filePath" << EOF
import java.io.*;
import java.math.*;
import java.util.*;

/*
   author : Multi-Thread
*/
public class Q${item} {

    // static int INF = 998244353;
    static int INF = (int) 1e9 + 7;
    static int MAX = Integer.MAX_VALUE;
    static int MIN = Integer.MIN_VALUE;

    public static void main(String[] args) {

        int test = fs.nextInt();
//        int test = 1;

        for (int cases = 0; cases < test; cases++) {

//			solve();
            final_answer.append(solve() + "\n");
        }
        out.print(final_answer.toString());
        out.flush();
    }

    static StringBuilder final_answer = new StringBuilder();

    static String solve() {
        String s = fs.next();
        int a = s.charAt(0) - '0';
        int b = s.charAt(2) - '0';
        return a + b + "";
    }

    static class Pair {
        int first, second;

        public Pair(int first, int second) {
            this.first = first;
            this.second = second;
        }

        public String toString() {
            return "[" + first + "," + second + "]";
        }
    }

    static class LongPair {
        long first;
        long second;

        LongPair(long a, long b) {
            this.first = a;
            this.second = b;
        }

        public String toString() {
            return "[" + first + "," + second + "]";
        }
    }

    static class FastReader {
        BufferedReader br;
        StringTokenizer st;

        public FastReader() {
            br = new BufferedReader(new InputStreamReader(System.in));
        }

        String next() {
            while (st == null || !st.hasMoreElements()) {
                try {
                    st = new StringTokenizer(br.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return st.nextToken();
        }

        int nextInt() {
            return Integer.parseInt(next());
        }

        long nextLong() {
            return Long.parseLong(next());
        }

        double nextDouble() {
            return Double.parseDouble(next());
        }

        String nextLine() {
            String str = "";
            try {
                str = br.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return str;
        }
    }

    static class OutputWriter {
        private final PrintWriter writer;

        public OutputWriter(OutputStream outputStream) {
            writer = new PrintWriter(new BufferedWriter(new OutputStreamWriter(outputStream)));
        }

        public OutputWriter(Writer writer) {
            this.writer = new PrintWriter(writer);
        }

        public void print(Object... objects) {
            for (int i = 0; i < objects.length; i++) {
                if (i != 0)
                    writer.print(' ');
                writer.print(objects[i]);
            }
        }

        public void println() {
            writer.print("\n");
        }

        public void printLine(Object... objects) {
            print(objects);
            writer.println();
        }

        public void close() {
            writer.close();
        }

        public void flush() {
            writer.flush();
        }

    }

    private static final FastReader fs = new FastReader();
    private static final OutputWriter out = new OutputWriter(System.out);
}
EOF
    elif [ "${CONTEST}" == "AC" ] || [ "${CONTEST}" == "CC" ]; then
    cat > $filePath << EOF
import java.io.*;
import java.math.*;
import java.util.*;

/*
   author : Multi-Thread
*/
public class Main {

    // static int INF = 998244353;
    static int INF = (int) 1e9 + 7;
    static int MAX = Integer.MAX_VALUE;
    static int MIN = Integer.MIN_VALUE;

    public static void main(String[] args) {

        int test = fs.nextInt();
//        int test = 1;

        for (int cases = 0; cases < test; cases++) {

//			solve();
            final_answer.append(solve() + "\n");
        }
        out.print(final_answer.toString());
        out.flush();
    }

    static StringBuilder final_answer = new StringBuilder();

    static String solve() {
        String s = fs.next();
        int a = s.charAt(0) - '0';
        int b = s.charAt(2) - '0';
        return a + b + "";
    }

    static class Pair {
        int first, second;

        public Pair(int first, int second) {
            this.first = first;
            this.second = second;
        }

        public String toString() {
            return "[" + first + "," + second + "]";
        }
    }

    static class LongPair {
        long first;
        long second;

        LongPair(long a, long b) {
            this.first = a;
            this.second = b;
        }

        public String toString() {
            return "[" + first + "," + second + "]";
        }
    }

    static class FastReader {
        BufferedReader br;
        StringTokenizer st;

        public FastReader() {
            br = new BufferedReader(new InputStreamReader(System.in));
        }

        String next() {
            while (st == null || !st.hasMoreElements()) {
                try {
                    st = new StringTokenizer(br.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return st.nextToken();
        }

        int nextInt() {
            return Integer.parseInt(next());
        }

        long nextLong() {
            return Long.parseLong(next());
        }

        double nextDouble() {
            return Double.parseDouble(next());
        }

        String nextLine() {
            String str = "";
            try {
                str = br.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return str;
        }
    }

    static class OutputWriter {
        private final PrintWriter writer;

        public OutputWriter(OutputStream outputStream) {
            writer = new PrintWriter(new BufferedWriter(new OutputStreamWriter(outputStream)));
        }

        public OutputWriter(Writer writer) {
            this.writer = new PrintWriter(writer);
        }

        public void print(Object... objects) {
            for (int i = 0; i < objects.length; i++) {
                if (i != 0)
                    writer.print(' ');
                writer.print(objects[i]);
            }
        }

        public void println() {
            writer.print("\n");
        }

        public void printLine(Object... objects) {
            print(objects);
            writer.println();
        }

        public void close() {
            writer.close();
        }

        public void flush() {
            writer.flush();
        }

    }

    private static final FastReader fs = new FastReader();
    private static final OutputWriter out = new OutputWriter(System.out);
}
EOF
    fi
    return 0
}

CreateFiles () {
    if [ -z ${QUESTIONS} ]; then
        QUESTIONS=6
    fi
    for ((item=1; item<=$QUESTIONS; item++));
        do
        GenerateFile ${item} "Q${item}.java"
        if [ $? -ne 0 ]; then
            echo "Error occured while generating file!"
        else
            echo "Done writing file Q${item}.java"
        fi
        done
}

CreateDirectory
if [ $? -ne 0 ]; then
    echo "Issue while creating directory ${DIR_PATH}"
    return 1
fi

CreateFiles
if [ $? -ne 0 ]; then
    echo "Issue while creating files"
    return 1
fi

if [ "${OPEN_IN_VSCODE}" == "TRUE" ]; then
    echo "Opening folder in VSCode"
    `code ./${DIR_PATH}`
    if [ $? -ne 0 ]; then
        echo "Cannot open folder in VSCODE!"
        return 1
    fi
elif [ "${OPEN_IN_INTELLIJ}" == "TRUE" ]; then
    echo "Opening folder in Intellij"
    `idea64.exe ./${DIR_PATH}`
    if [ $? -ne 0 ]; then
        echo "Cannot open folder in IntelliJ!"
        return 1
    fi
fi