/**
 * @Title DemoController.java 
 * @Package com.ibis.pz.controller 
 * @Description 
 * @author miyb  
 * @date 2015-5-13 上午10:28:47 
 * @version V1.0   
 */
package com.xnjr.cpzc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/** 
 * @author: miyb 
 * @since: 2015-5-13 上午10:28:47 
 * @history:
 */
@Controller
@RequestMapping(value = "/file")
public class FileController {
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public boolean upload(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = "fileName", required = false) String fileName)
            throws IOException {
        System.out.println(fileName);
        if (file != null) {
            String oldName = file.getOriginalFilename();
            String path = "/Users/xieyj/" + oldName;
            System.out.println(path);
            File localFile = new File(path);
            // 写文件到本地
            file.transferTo(localFile);
        }
        return true;
    }

    @RequestMapping(value = "/upload_2", method = RequestMethod.POST)
    public boolean upload2(
            @RequestParam(value = "file", required = false) String fileStr,
            @RequestParam(value = "fileName", required = false) String fileName)
            throws IOException {
        String header = "data:image/jpeg;base64,";
        fileStr = fileStr.substring(header.length());
        decodeBase64ToImage(fileStr, "/Users/xieyj/", "aab.jpg");
        return true;
    }

    public static boolean GenerateImage(String imgStr) {// 对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) // 图像数据为空
            return false;
        Base64 base64 = new Base64();
        try {
            // Base64解码
            byte[] b = base64.decode(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// 调整异常数据
                    b[i] += 256;
                }
            }
            // 生成jpeg图片
            String imgFilePath = "/Users/xieyj/aa.jpg";// 新生成的图片
            FileOutputStream out = new FileOutputStream(imgFilePath);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 将Base64位编码的图片进行解码，并保存到指定目录
     * 
     * @param base64
     *            base64编码的图片信息
     * @return
     */
    public static void decodeBase64ToImage(String base64, String path,
            String imgName) {
        Base64 decoder = new Base64();
        try {
            FileOutputStream write = new FileOutputStream(new File(path
                    + imgName));
            byte[] decoderBytes = decoder.decode(base64);
            write.write(decoderBytes);
            write.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
