package com.example.travelsystem.exception;

public enum APICodeMsg {
    SUCCESS(0, ""),

    REQUEST_PARAM_ERROR(10000, "request param error"),
    TOKEN_INVALID(10001, "token invalid"),

    USERNAME_HAS_EXIST(20001, "username has existed"),
    PASSWORD_ERROR(20002, "password error");

    public int code;
    public String message;

    APICodeMsg(int code, String message) {
        this.code = code;
        this.message = message;
    }
}
