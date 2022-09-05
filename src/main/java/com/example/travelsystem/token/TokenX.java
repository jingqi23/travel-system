package com.example.travelsystem.token;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.travelsystem.tools.StringUtils;

import java.util.Date;

public class TokenX {
    private static final String SECRET = "abcdefg";
    private static final long ONE_DAY_IN_MILLIS = 1000 * 60 * 60 * 24 * 30L;

    public static String getToken(String user) {
        return getToken(user, ONE_DAY_IN_MILLIS);
    }

    public static String getToken(String user, long expires) {
        return JWT.create().withIssuer("ec-server").withAudience(user).withExpiresAt(new Date(System.currentTimeMillis() + expires)).sign(Algorithm.HMAC256(user + SECRET));
    }

    public static String  verifyToken(String token) {
        try {
            String uid = JWT.decode(token).getAudience().get(0);
            if (StringUtils.isNullOrEmpty(uid)) return null;

            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(uid + SECRET)).build();
            verifier.verify(token);
            return uid;
        } catch (Exception e) {
            return null;
        }
    }
}
// TODO: 2022/8/27 token redis缓存
