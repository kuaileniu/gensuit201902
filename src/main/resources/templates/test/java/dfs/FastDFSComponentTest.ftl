package ${gen.dfsPackage?replace("/",".")};

import static org.junit.Assert.assertArrayEquals;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.csource.common.MyException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.test.context.junit4.SpringRunner;
 
@RunWith(SpringRunner.class)
@SpringBootTest
public class FastDFSComponentTest {
//	group1/M00/00/00/rBFJEFrimjmAMxeRAAAM--dWkPY794.png
//	group1/M00/00/00/rBFJEFrittGAdeydAAAM--dWkPY936.png

	@Test
	public void uploadAndDownloadTest() throws IOException, MyException, InterruptedException {
		<#--Resource resource = new ClassPathResource("WX20170714-164859.png");-->
		Resource resource = new ClassPathResource("logo.jpg");
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
		InputStream inputStream = resource.getInputStream();
		byte[] buff = new byte[1024];
		int rc = 0;
		while ((rc = inputStream.read(buff, 0, 100)) > 0) {
			swapStream.write(buff, 0, rc);
		}
		buff = swapStream.toByteArray();
//		String filePath = FastDFSComponent.upload(buff, "png");    // 需要都配置group，否则默认走 privatefile，当 privatefile挂掉时 走publicfile
//		String filePath = FastDFSComponent.upload("publicfile",buff, "png");  //	publicfile/M00/00/00/rBFJEFrittGAdeydAAAM--dWkPY936.png
		String filePath = FastDFSComponent.upload("privatefile",buff, "png"); //	privatefile/M00/00/00/rBFJEFrittGAdeydAAAM--dWkPY936.png

		System.out.println(filePath);
		Thread.sleep(2000);// 集群同步需要时间，在此处等一下

		byte[] downloadbuff = FastDFSComponent.download(filePath);
		assertArrayEquals(buff, downloadbuff);
	}
}
