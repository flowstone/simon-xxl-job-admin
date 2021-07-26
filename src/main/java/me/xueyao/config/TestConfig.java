package me.xueyao.config;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author Simon.Xue
 * @date 2021/7/26 8:34 下午
 **/
@Getter
@Configuration
public class TestConfig {
    @Value("${test}")
    private String abc;

}
