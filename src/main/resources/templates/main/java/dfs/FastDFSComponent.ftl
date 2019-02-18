package ${gen.dfsPackage?replace("/",".")};

import java.io.IOException;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import javax.annotation.PostConstruct;

import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
 
@Component
public class FastDFSComponent {
    private static Logger log = LoggerFactory.getLogger(FastDFSComponent.class);

    private static FastDFSComponent dfs;

    @PostConstruct
    public void init() {
        try {
            ClientGlobal.initByProperties("fastdfs-client.properties");
        } catch (IOException | MyException e) {
            log.error("FastDFSComponent init ", e);
        }
        dfs = this;
    }

    public static void check() {
//        log.info("ClientGlobal.configInfo(): " + ClientGlobal.configInfo());
//        if (dfs == null) {
//            throw new RuntimeException("dfs service initialization was failed for some reasons");
//        }
    }

    public static String upload(byte[] buff, String fileExtName) throws IOException, MyException {
        check();
        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = null;
        try {
            trackerServer = tracker.getConnection();
            StorageServer storageServer = null;
            StorageClient1 client = new StorageClient1(trackerServer, storageServer);
            String fileId = client.upload_file1(buff, fileExtName, null);
            return fileId;
        } catch (IOException | MyException e) {
            throw e;
        } finally {
            trackerServer.close();
        }
    }

    public static String upload(String groupName, byte[] buff, String fileExtName) throws IOException, MyException {
        check();
        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = null;
        try {
            trackerServer = tracker.getConnection();
            StorageServer storageServer = null;
            StorageClient1 client = new StorageClient1(trackerServer, storageServer);
            String fileId = client.upload_file1(groupName, buff, fileExtName, null);
            return fileId;
        } catch (IOException | MyException e) {
            throw e;
        } finally {
            trackerServer.close();
        }
    }

    /**
     * @param multipartFile
     * @return fastDFS field_id
     */
    public static String upload(MultipartFile multipartFile) {
        try {
            String fileName = multipartFile.getOriginalFilename();
            String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
            return upload(multipartFile.getBytes(), ext);  //upload to fastdfs
        } catch (Exception e) {
            log.error("upload to FastDFS时异常", e);
            return null;
        }
    }

    /**
     * @param groupName
     * @param multipartFile
     * @return
     */
    public static String upload(String groupName, MultipartFile multipartFile) {
        try {
            String fileName = multipartFile.getOriginalFilename();
            String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
            return upload(groupName, multipartFile.getBytes(), ext);  //upload to fastdfs
        } catch (Exception e) {
            log.error("upload to FastDFS时异常", e);
            return null;
        }
    }

    public static byte[] download(String file_id) throws IOException, MyException {
        check();
        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = null;
        try {
            trackerServer = tracker.getConnection();
            StorageServer storageServer = null;
            StorageClient1 client = new StorageClient1(trackerServer, storageServer);
            byte[] re = client.download_file1(file_id);
            return re;
        } catch (IOException | MyException e) {
            throw e;
        } finally {
            trackerServer.close();
        }
    }


    public static InputStream downloadStream(String file_id) throws IOException, MyException {
        check();
        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = null;
        try {
            trackerServer = tracker.getConnection();
            StorageServer storageServer = null;
            StorageClient1 client = new StorageClient1(trackerServer, storageServer);
            byte[] fileByte = client.download_file1(file_id);
            InputStream ins = new ByteArrayInputStream(fileByte);
            return ins;
        } catch (IOException | MyException e) {
            throw e;
        } finally {
            trackerServer.close();
        }
    }  


    public static boolean delete(String file_id) throws Exception {
        check();
        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = null;
        try {
            trackerServer = tracker.getConnection();
            StorageServer storageServer = null;
            StorageClient1 client = new StorageClient1(trackerServer, storageServer);
            return client.delete_file1(file_id) == 0;
        } catch (IOException | MyException e) {
            throw e;
        } finally {
            trackerServer.close();
        }
    } 


}
