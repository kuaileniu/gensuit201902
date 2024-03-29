package cn.zhsit.utils;


import java.math.BigInteger;
import java.security.SecureRandom;

public final class ZhsID {
    private final long mostSigBits;
    private final long leastSigBits;

    private static class Holder {
        static final SecureRandom numberGenerator = new SecureRandom();
    }

    private ZhsID(byte[] data) {
        long msb = 0;
        long lsb = 0;
        for (int i = 0; i < 8; i++)
            msb = (msb << 8) | (data[i] & 0xff);
        for (int i = 8; i < 16; i++)
            lsb = (lsb << 8) | (data[i] & 0xff);
        this.mostSigBits = msb;
        this.leastSigBits = lsb;
    }

    public static String id25(){
      return new BigInteger(id32(),16).toString(36);
    }

    public static String id32() {
        SecureRandom ng = Holder.numberGenerator;
        byte[] randomBytes = new byte[16];
        ng.nextBytes(randomBytes);
        randomBytes[6] &= 0x0f;
        randomBytes[6] |= 0x40;
        randomBytes[8] &= 0x3f;
        randomBytes[8] |= 0x80;
        return new ZhsID(randomBytes).getString();
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


}
