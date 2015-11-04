/*
 * 
 */
// Created on 2014-3-25

package com.yaoyan.exception;

import java.text.MessageFormat;

/**
 * AO层异常
 * 
 * @author joe.chen
 */
public class AOException extends RuntimeException {

    /**
     * 
     */
    private static final long serialVersionUID = -4185995573038293291L;

    private Integer code;

    private String msg;

    public AOException(int code, String msg, Object... args) {
        super(MessageFormat.format(msg, args));
        this.code = code;
        this.msg = msg;
    }

    public AOException(Throwable t) {
        super(t);
    }

    public AOException(String msg, Object... args) {
        super(MessageFormat.format(msg, args));
    }

    public AOException(Throwable t, String msg, Object... args) {
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
