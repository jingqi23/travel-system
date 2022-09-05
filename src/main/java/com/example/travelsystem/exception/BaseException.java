package com.example.travelsystem.exception;

public class BaseException extends RuntimeException {
    private int code;
    private String message;

    private BaseException() {
    }

    public BaseException(APICodeMsg apiCodeMsg) {
        this.code = apiCodeMsg.code;
        this.message = apiCodeMsg.message;
    }

    public BaseException(APICodeMsg apiCodeMsg, String extraMessage) {
        this.code = apiCodeMsg.code;
        this.message = apiCodeMsg.message + " | " + extraMessage;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
