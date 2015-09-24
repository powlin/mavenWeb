/**
 * @Title FileOperateAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年9月24日 上午10:26:27 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Decoder.BASE64Encoder;

import com.xnjr.cpzc.ao.IImageAO;

/** 
 * @author: xieyj 
 * @since: 2015年9月24日 上午10:26:27 
 * @history:
 */
@Service
public class ImageAOImpl implements IImageAO {

    @Autowired
    private ServletContext servletContext;

    @Override
    public String getImageStr(String imgPath) {
        String imageString = "";
        if (imgPath == null || imgPath == "") {
            return "";
        }
        imgPath = servletContext.getAttribute("picUrl").toString() + imgPath;
        File file = new File(imgPath);
        if (!file.exists()) {
            return "";
        }
        byte[] data = null;
        InputStream input = null;
        try {
            input = new FileInputStream(imgPath);
            data = getByte(input);
            BASE64Encoder encoder = new BASE64Encoder();
            imageString = encoder.encode(data);
            input.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imageString;
    }

    public static byte[] getByte(InputStream in) {
        if (in == null) {
            return null;
        }
        int sumSize = 0;
        List<byte[]> totalBytes = new ArrayList<byte[]>();
        byte[] buffer = new byte[1024];
        int length = -1;
        try {
            while ((length = in.read(buffer)) != -1) {
                sumSize += length;
                byte[] tmp = new byte[length];
                System.arraycopy(buffer, 0, tmp, 0, length);
                totalBytes.add(tmp);
            }
            byte[] data = new byte[sumSize];
            int start = 0;
            for (byte[] tmp : totalBytes) {
                System.arraycopy(tmp, 0, data, start, tmp.length);
                start += tmp.length;
            }
            return data;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
