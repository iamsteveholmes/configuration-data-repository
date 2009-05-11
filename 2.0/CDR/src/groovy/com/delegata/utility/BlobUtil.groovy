package com.delegata.utility

import java.sql.SQLException
import java.sql.Blob

/**
 * User: sholmes
 * Date: May 21, 2008
 * Time: 3:53:12 PM
 */
class BlobUtil {
    public static byte[] toByteArray(Blob fromBlob) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            return toByteArrayImpl(fromBlob, baos);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (baos != null) {
                try {
                    baos.close();
                } catch (IOException ex) {
                }
            }
        }
    }

    public static byte[] toByteArrayImpl(Blob fromBlob, ByteArrayOutputStream baos) {
        byte[] buf = new byte[4000];
        InputStream is = fromBlob.getBinaryStream();
        try {
            while (true) {
                int dataSize = is.read(buf);

                if (dataSize == -1)
                    break;
                baos.write(buf, 0, dataSize);
            }
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }
        return baos.toByteArray();
    }
}