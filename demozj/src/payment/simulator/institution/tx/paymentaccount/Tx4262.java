package payment.simulator.institution.tx.paymentaccount;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.api.tx.paymentaccount.Tx4262Request;


/**
 * [业务逻辑描述]
 * 
 * <pre>
 * Modify Information:
 * Author       Date        Description
 * ============ =========== ============================
 * VBA Macro    2014/8/15   Create this file
 * 
 * </pre>
 */
public class Tx4262 extends HttpServlet{

    private static final long serialVersionUID = -2314166584340483320L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            // 1.取得参数
            String institutionID = request.getParameter("InstitutionID");
            String agreementNo = request.getParameter("AgreementNo");

            // 2.创建交易请求对象
            Tx4262Request tx4262Request = new Tx4262Request();
            tx4262Request.setInstitutionID(institutionID);
            tx4262Request.setAgreementNo(agreementNo);

            // 3.执行报文处理
            tx4262Request.process();

            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx4262Request.getRequestPlainText());
            request.setAttribute("message", tx4262Request.getRequestMessage());
            request.setAttribute("signature", tx4262Request.getRequestSignature());
            request.setAttribute("txCode", "4262");
            request.setAttribute("txName", "用户支付账户扣款签约查询");
            request.setAttribute("Flag", "20");
            request.setAttribute("action", request.getContextPath() + "/SendMessage");

            // 5.转向Request.jsp页面
            request.getRequestDispatcher("/Request.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
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

