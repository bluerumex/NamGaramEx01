package orz.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import orz.zerock.domain.BoardVO;
import orz.zerock.domain.Criteria;
import orz.zerock.domain.SearchCriteria;
import orz.zerock.persistence.BoardDAO;

@Service
public class BoardServicImpl implements BoardService {

    @Inject
    private BoardDAO dao;

    @Override
    public void regist(BoardVO vo) throws Exception {
        dao.create(vo);
    }

    @Override
    public BoardVO read(Integer bno) throws Exception {
        return dao.read(bno);
    }

    @Override
    public void update(BoardVO vo) throws Exception {
        dao.update(vo);
    }

    @Override
    public void remove(Integer bno) throws Exception {
        dao.delete(bno);
    }

    @Override
    public List<BoardVO> listAll() throws Exception {
        return dao.listAll();
    }

    @Override
    public List<BoardVO> listCriteria(Criteria cri) throws Exception {
        return dao.listCriteria(cri);
    }

    @Override
    public int listCountCriteria(Criteria cri) throws Exception {
        return dao.countPaging(cri);
    }

    @Override
    public void modify(BoardVO vo) throws Exception {
        dao.modify(vo);
    }

    @Override
    public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
        return dao.listSearch(cri);
    }

    @Override
    public int listSearchCount(SearchCriteria cri) throws Exception {
        return dao.listSearchCount(cri);
    }

}
