package com.itheima.reggie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itheima.reggie.entity.Dish;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface DishMapper extends BaseMapper<Dish> {
    @Update("<script>"
            + "UPDATE dish"
            + " SET status = #{status}"
            + " WHERE id IN "
            + "<foreach item='id' index='index' collection='ids' open='(' separator=',' close=')'>"
            + "#{id}"
            + "</foreach>"
            + "</script>")
    int updateBatchStatusByIds(@Param("status") Integer status, @Param("ids") List<Long> ids);

}
