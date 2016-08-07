package orz.zerock.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import orz.zerock.domain.BoardVO;
import orz.zerock.domain.Criteria;
import orz.zerock.domain.SearchCriteria;
import orz.zerock.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

    @Inject
    private BoardDAO dao;

    Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
/*
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
*/
    @Test
    public void testListPage() throws Exception {
        int page = 3;

        List<BoardVO> list = dao.listPage(page);

        for (BoardVO vo : list) {
            logger.info(vo.getBno() + ":" + vo.getTitle());
        }
    }

    @Test
    public void testListCriteria() throws Exception {
        Criteria cri = new Criteria();
        cri.setPage(2);
        cri.setPerPageNum(20);

        List<BoardVO> list = dao.listCriteria(cri);

        for (BoardVO vo : list) {
            logger.info(vo.getBno() + ":" + vo.getTitle());
        }
    }

    @Test
    public void testURI() throws Exception {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .path("/board/list")
                .queryParam("bno", 12)
                .queryParam("perPageNum", 20)
                .build();

        logger.info("/board/read?bno=12&perPageNum=20");
        logger.info(uriComponents.toString());

    }

    @Test
    public void testDynamic1() throws Exception {
        SearchCriteria cri = new SearchCriteria();
        cri.setPage(1);
        cri.setKeyword("한글");
        cri.setSearchType("t");

        logger.info("======================================================");

        List<BoardVO> list = dao.listSearch(cri);

        for (BoardVO vo : list) {
            logger.info(vo.getBno() + " : " + vo.getTitle());
        }

        logger.info("======================================================");

        logger.info("COUNT : " + dao.listSearchCount(cri));
    }
}
