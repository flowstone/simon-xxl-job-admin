package me.xueyao.test;

import me.xueyao.SimonXxlJobAdminApplication;
import me.xueyao.config.TestConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * @author Simon.Xue
 * @date 2021/7/26 9:06 下午
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = SimonXxlJobAdminApplication.class)
public class HelloTest {
    @Resource
    private TestConfig testConfig;

    @Test
    public void test() {
        System.out.println(testConfig.getAbc());
    }
}
