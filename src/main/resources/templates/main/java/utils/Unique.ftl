package ${gen.utilPackage?replace("/",".")};

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.*;

public final class Unique {
    public static final String SystemSelf = unique25();
    private final long mostSigBits;
    private final long leastSigBits;
    private final static long start = 1514649600000L;
    //private final static int cha = (1 << 24) - 1;
    private final static int cha = 0xFFFF;
    //private static volatile byte one = 0;
    private static volatile byte one = (byte) Holder.numberGenerator.nextInt(0xFF);
    private static volatile short two = (short) Holder.numberGenerator.nextInt(0xFFFF) ;

    private static class Holder {
        static final SecureRandom numberGenerator = new SecureRandom();
    }

    private Unique(byte[] data) {
        long msb = 0;
        long lsb = 0;
        for (int i = 0; i < 8; i++)
            msb = (msb << 8) | (data[i] & 0xff);
        for (int i = 8; i < 16; i++)
            lsb = (lsb << 8) | (data[i] & 0xff);
        this.mostSigBits = msb;
        this.leastSigBits = lsb;
    }

    public static String unique25() {
        return new BigInteger(unique32(), 16).toString(36);
    }

    private static String unique32() {
        SecureRandom ng = Holder.numberGenerator;
        byte[] randomBytes = new byte[16];
        ng.nextBytes(randomBytes);
        randomBytes[6] &= 0x0f;
        randomBytes[6] |= 0x40;
        randomBytes[8] &= 0x3f;
        randomBytes[8] |= 0x80;
        return new Unique(randomBytes).getString();
    }

    private String getString() {
        return (digits(mostSigBits >> 32, 8) +
                digits(mostSigBits >> 16, 4) +
                digits(mostSigBits, 4) +
                digits(leastSigBits >> 48, 4) +
                digits(leastSigBits, 12));
    }

    private static String digits(long val, int digits) {
        long hi = 1L << (digits * 4);
        return Long.toHexString(hi | (val & (hi - 1))).substring(1);
    }

    public static long uniqueLong() {
        int random = Holder.numberGenerator.nextInt(cha);
        if (one == 20) {
            try {
                Thread.sleep(1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        //return ((System.currentTimeMillis() -start) << 24) + random;
        return ((System.currentTimeMillis() - start) << 24) + ((one++&0xFF) << 16) + random;
        //return ((System.currentTimeMillis() - start) << 24) + ((one++ & 0xFF) << 16) + (two++ & 0xFFFF);
    }


    public static void main4(String[] args) {
        for (int k = 0; k < 100; k++) {
            int size = 100 * 100 * 10;
            // size = 100 * 100;
            // size = 100 * 10;
            // size = 100 * 1 ;
            Map<Long, Long> m = new HashMap<>(size);
            for (int i = 0; i < size; i++) {
                Long num = uniqueLong();
                m.put(num, num);
            }
            if (m.size() == size) {
            } else {
              System.out.println(m.size());
            }
        }
    }
}

<#--long year2018 = new GregorianCalendar(2018, 00, 00, 00, 00, 00).getTimeInMillis();-->
<#--year2018的值为1514649600000;-->
<#--每年的值为31536000000-->
