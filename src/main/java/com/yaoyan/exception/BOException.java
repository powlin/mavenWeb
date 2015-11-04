/*
 * 
 */
// Created on 2014-3-12

package com.yaoyan.exception;

import java.text.MessageFormat;

/**
 * BO层异常
 * 
 * @author joe.chen
 */
public class BOException extends RuntimeException {

    private static final long serialVersionUID = 145829665786329638L;

    private Integer code;

    private String msg;

    public BOException(int code, String msg, Object... args) {
        super(MessageFormat.format(msg, args));
        this.code = code;
        this.msg = msg;
    }

    public BOException(Throwable t) {
        super(t);
    }

    public BOException(String msg, Object... args) {
        super(MessageFormat.format(msg, args));
    }

    public BOException(Throwable t, String msg, Object... args) {
        super(MessageFormat.format(msg, args), t);
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    @Override
    public synchronized Throwable fillInStackTrace() {
        return this;
    }

}
