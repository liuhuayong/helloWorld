package payment.simulator.institution.tx.marketorder;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.api.tx.marketorder.Tx1344Request;

/**
 * 市场订单批量结算查询
 * <pre>
 * Modify Information:
 * Autor		Date		Description
 * ============ =========== ===============
 * caohc        2017-3-14  Create this file
 *
 * </pre>
 */
public class Tx1344 extends HttpServlet {

    private static final long serialVersionUID = 21650963058448654L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1.取得参数
            String institutionID = request.getParameter("InstitutionID");
            String orderNo = request.getParameter("OrderNo");
            String batchNo = request.getParameter("BatchNo");

            // 2.创建交易请求对象
            Tx1344Request tx1344Request = new Tx1344Request();
            tx1344Request.setInstitutionID(institutionID);
            tx1344Request.setOrderNo(orderNo);
            tx1344Request.setBatchNo(batchNo);

            // 3.执行报文处理
            tx1344Request.process();

            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx1344Request.getRequestPlainText());
            request.setAttribute("message", tx1344Request.getRequestMessage());
            request.setAttribute("signature", tx1344Request.getRequestSignature());
            request.setAttribute("txCode", "1344");
            request.setAttribute("txName", "市场订单批量结算查询");
            request.setAttribute("action", request.getContextPath() + "/SendMessage");

            // 5.转向Request.jsp页面
            request.getRequestDispatcher("/Request.jsp").forward(request, response);

        } catch (Exception e) {
            processException(request, response, e.getMessage());
        }
    }

    private void processException(HttpServletRequest request, HttpServletResponse response, String errorMessage) {
        try {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/ErrorPage.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

}
