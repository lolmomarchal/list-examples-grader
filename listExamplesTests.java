import static org.junit.Assert.*;
import org.junit.*;

import java.util.ArrayList;

import static org.junit.Assert.*;
import org.junit.*;

import java.util.ArrayList;

public class TestListExamples {
    // Write your grading tests here!
    class CheckerContainsB implements StringChecker {
        public boolean checkString(String s) {
            return s.contains("b");
        }
    }

    @Test
    public void testFilter() {
        StringChecker sc = new CheckerContainsB();
        ArrayList<String> arr = new ArrayList<>();
        arr.add("ball");
        arr.add("hi");
        arr.add("bad");
        ArrayList<String> expectedArr = new ArrayList<>();
        expectedArr.add("ball");
        expectedArr.add("bad");
        assertEquals(expectedArr, ListExamples.filter(arr, sc));
    }

    @Test
    public void testMerge() {
        ArrayList<String> arr1 = new ArrayList<>();
        arr1.add("a");
        arr1.add("b");
        arr1.add("c");
        ArrayList<String> arr2 = new ArrayList<>();
        arr2.add("a");
        arr2.add("d");
        arr2.add("f");
        ArrayList<String> output = new ArrayList<>();
        output.add("a");
        output.add("a");
        output.add("b");
        output.add("c");
        output.add("d");
        output.add("f");

        assertEquals(output, ListExamples.merge(arr1, arr2));
    }
}import static org.junit.Assert.*;
        import org.junit.*;

        import java.util.ArrayList;

public class TestListExamples {
    // Write your grading tests here!
    class CheckerContainsB implements StringChecker {
        public boolean checkString(String s) {
            return s.contains("b");
        }
    }

    @Test
    public void filterTest() {
        StringChecker sc = new CheckerContainsB();
        ArrayList<String> arr = new ArrayList<>();
        arr.add("bat");
        arr.add("hello");
        arr.add("ba");
        arr.add("ball");
        arr.add("bau");
        ArrayList<String> expectedArr = new ArrayList<>();
        expectedArr.add("bat");
        expectedArr.add("ba");
        expectedArr.add("ball");
        expectedArr.add("bau");

        assertEquals(expectedArr, ListExamples.filter(arr, sc));
    }

    @Test
    public void mergeTest() {
        ArrayList<String> arr1 = new ArrayList<>();
        arr1.add("a");
        arr1.add("b");
        arr1.add("c");
        ArrayList<String> arr2 = new ArrayList<>();
        arr2.add("d");
        arr2.add("e");
        arr2.add("f");

        ArrayList<String> output = new ArrayList<>();
        output.add("a");
        output.add("b");
        output.add("c");
        output.add("d");
        output.add("e");
        output.add("f");

        assertEquals(output, ListExamples.merge(arr1, arr2));
    }
}