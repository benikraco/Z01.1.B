/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

public class Code {

    public static String dest(String[] mnemnonic) {
        String reg = "";

        if (mnemnonic.length == 2){
            switch (mnemnonic[1]) { //se o mnemonic[
                case "%A":
                    return "0001";
                case "%D":
                    return "0010";
                case "(%A)":
                    return "0100";
                default:
                    return "0000";
            }
        } else if (mnemnonic.length == 3){
            reg = mnemnonic[1]+mnemnonic[2];
            switch (reg) { //se o mnemonic[
                case "%D%A":
                    return "0011";
                case "(%A)%A":
                    return "0101";
                case "(%A)%D":
                    return "0110";
                default:
                    return "0000";
            }
        } else if (mnemnonic.length >= 3){
            reg = mnemnonic[1]+mnemnonic[2]+mnemnonic[3];
            switch (reg) { //se o mnemonic[
                case "(%A)%A%D":
                    return "0111";
                default:
                    return "0000";
            }
        }
        return "0000";
    }

    public static String comp(String[] mnemnonic) {

        int movInt = 0;

        String comp = "";

        if (mnemnonic[0].startsWith("mov")) {
            comp = mnemnonic[1];
            movInt = 1;
        } else if (mnemnonic[0].startsWith("add")) {
            comp = mnemnonic[1]+"+"+mnemnonic[2];
        } else if (mnemnonic[0].startsWith("sub")) {
            comp = mnemnonic[1]+"-"+mnemnonic[2];
        } else if (mnemnonic[0].startsWith("rsub")) {
            comp = mnemnonic[2]+"-"+mnemnonic[1];
        } else if (mnemnonic[0].startsWith("inc")) {
            comp = mnemnonic[1]+"+1";
        } else if (mnemnonic[0].startsWith("dec")) {
            comp = mnemnonic[1]+"-1";
        } else if (mnemnonic[0].startsWith("not")) {
            comp = "!"+mnemnonic[1];
        } else if (mnemnonic[0].startsWith("neg")) {
            comp = "-"+mnemnonic[1];
        } else if (mnemnonic[0].startsWith("and")) {
            comp = mnemnonic[1]+"&"+mnemnonic[2];
        } else if (mnemnonic[0].startsWith("or")) {
            comp = mnemnonic[1]+"|"+mnemnonic[2];
        } else if (mnemnonic[0].startsWith("nop")) {
            comp = "$0";
        } else if ( mnemnonic[0].startsWith("jg")  ||
                mnemnonic[0].startsWith("je")  ||
                mnemnonic[0].startsWith("jge") ||
                mnemnonic[0].startsWith("jl")  ||
                mnemnonic[0].startsWith("jne") ||
                mnemnonic[0].startsWith("jle") ||
                mnemnonic[0].startsWith("jmp") )
        {
            if (mnemnonic.length == 1)
                comp = "%X";
            else
                comp = mnemnonic[1];
        }


        String r2 = "0";     // Operacao entre S e D
        String r1 = "0";     // A = 0; (A) = 1
        String r0 = "0";     // A = 0; D = 1
        boolean Xs = false;
        boolean Xd = false;

        for (int i = 0; i < mnemnonic.length - movInt; i++) {
            if (mnemnonic[i].contains("(%A)"))
                r0 = "1";
        }

        comp = comp.replace("(%A)", "%Y");
        comp = comp.replace("%A", "%Y");
        comp = comp.replace("%D", "%X");
        comp = comp.replace("$", "");

        String c = "000000";
        switch (comp) {
            case "0":    c = "101010"; break;
            case "1":    c = "111111"; break;
            case "-1":   c = "111010"; break;
            case "%X":    c = "001100"; break;
            case "%Y":    c = "110000"; break;
            case "!%X":   c = "001101"; break;
            case "!%Y":   c = "110001"; break;
            case "-%X":   c = "001111"; break;
            case "-%Y":   c = "110011"; break;
            case "%X+1":  case "1+%X": c = "011111"; break;
            case "%Y+1":  case "1+%Y": c = "110111";  break;
            case "%X-1":  c = "001110"; break;
            case "%Y-1":  c = "110010"; break;
            case "%X+%Y": c = "000010"; break;
            case "%Y+%X": c = "000010"; break;
            case "%X-%Y": c = "010011"; break;
            case "%Y-%X": c = "000111"; break;
            case "%X&%Y": c = "000000"; break;
            case "%Y&%X": c = "000000"; break;
            case "%X|%Y": c = "010101"; break;
            case "%Y|%X": c = "010101"; break;
            default: break;
        }
        return r2 + r1 + r0 + c;
    }

    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]){
<<<<<<< HEAD
            case "jmp" : return "111";

            default : return "000";
=======
            case "jg"  : return "001";
            case "je"  : return "010";
            case "jge"  : return "011";
            case "jl"  : return "100";
            case "jne"  : return "101";
            case "jle"  : return "110";
            case "jmp"  : return "111";
            default    : return "000";
>>>>>>> 0e5498fdabcbfd398df51df7656bc04492637ceb
        }
    }

    public static String toBinary(String symbol) {
        String binValue = Integer.toBinaryString(Integer.parseInt(symbol));
        int length = binValue.length();
        StringBuilder zeroes = new StringBuilder();
        String zero = "0";
        int difference = 15 - length;
        while (difference >= 0){
            zeroes.append(zero);
            difference -= 1;
        }
        return zeroes+binValue;
    }

}

