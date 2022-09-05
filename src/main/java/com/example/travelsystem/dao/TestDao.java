package com.example.travelsystem.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.travelsystem.entity.Test;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDao extends BaseMapper<Test> {
}
