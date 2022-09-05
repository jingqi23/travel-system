package com.example.travelsystem.controller;

public class Response<T> {
    private int code;
    private String message;
    private T data;

    private Response() {
    }

    private Response(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <R> Response<R> makeSuccessResult(R data) {
        return new Response<>(0, "", data);
    }

    public static Response<String> makeFailResult(int code, String message) {
        return new Response<>(code, message, null);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Response{" +
                "code=" + code +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }
}
