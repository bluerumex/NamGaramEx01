package orz.zerock.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import orz.zerock.domain.BoardVO;
import orz.zerock.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

    @Inject
    private BoardDAO dao;

    Logger logger;

    @Test
    public void testCreate() throws Exception {
        BoardVO vo = new BoardVO();
        vo.setTitle("새로운 글을 넣습니다.");
        vo.setContent("새로운 글을 넣습니다.");
        vo.setWriter("user00");
        dao.create(vo);
    }

    @Test
    public void testRead() throws Exception {
        logger.info(dao.read(1).toString());
    }

    @Test
    public void testUpdate() throws Exception {
        BoardVO vo = new BoardVO();
        vo.setTitle("수정된 글을 넣습니다.");
        vo.setContent("수정된 글을 넣습니다.");
        dao.update(vo);
    }

    @Test
    public void testDelete() throws Exception {
        dao.delete(1);
    }
}
