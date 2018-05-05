package payment.simulator.institution.tx.paymentaccount;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.api.system.PaymentUserEnvironment;
import payment.api.tx.paymentaccount.Tx4246Request;



/**
 * 用户支付账户银行账户解绑（托管户）
 * 
 * <pre>
 * Modify Information:
 * Author       Date        Description
 * ============ =========== ============================
 * VBA Macro    2014/8/15   Create this file
 * 
 * </pre>
 */
public class Tx4246 extends HttpServlet{

    private static final long serialVersionUID = -2314166584340483322L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1.创建交易请求对象
            Tx4246Request tx4246Request = new Tx4246Request();

            // 2.取得参数
            // 此处为接口字段定义，Loop Start
            tx4246Request.setInstitutionID(request.getParameter("InstitutionID"));
            tx4246Request.setPaymentAccountNumber(request.getParameter("PaymentAccountNumber"));
            tx4246Request.setPageURL(request.getParameter("PageURL"));
            tx4246Request.setBindingSystemNo(request.getParameter("BindingSystemNo"));
            // 此处为接口字段定义，Loop End

            // 3.执行报文处理
            tx4246Request.process();

            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx4246Request.getRequestPlainText());
            request.setAttribute("message", tx4246Request.getRequestMessage());
            request.setAttribute("signature", tx4246Request.getRequestSignature());
            request.setAttribute("txCode", "4246");
            request.setAttribute("txName", "用户支付账户银行账户解绑（托管户）");
            request.setAttribute("action", PaymentUserEnvironment.mobilepaymentuserpayURL);

            // 5.转向Request4Mobile.jsp页面
            request.getRequestDispatcher("/Request4Mobile.jsp").forward(request, response);

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

