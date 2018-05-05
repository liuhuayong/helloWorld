package payment.simulator.institution.utils;


import cpcn.institution.tools.util.Base64;
import cpcn.institution.tools.util.StringUtil;
import payment.api.vo.CmbUserAccountInfo;

public class CMBSigner {
    private CMBSigner() {
    }

    public static String Sign(CmbUserAccountInfo rtInfo) throws Exception {
        
        String toSignText = rtInfo.getUsrNbr() + "|" +rtInfo.getUsrNam() + "|" +rtInfo.getAccSeq() + "|" + rtInfo.getEacNam()
                            + "|"+ rtInfo.getEacNbr() + "|" + rtInfo.getEacBnk()+ "|" + rtInfo.getPvcCod() + "|" + rtInfo.getCtyCod()
                            + "|" + rtInfo.getBnkNam() + "|" + rtInfo.getBrdNbr()+ "|" + rtInfo.getCtfTyp() + "|" + rtInfo.getCtfIdc()
                            + "|" + rtInfo.getRolTyp() + "|" + rtInfo.getSigTim();
        String signerID = "cmbsigner";
        signerID += rtInfo.getSigTyp().trim();
 
        return new String( Base64.encode(NativeSignatureFactory.getSigner(signerID).sign(toSignText.getBytes(StringUtil.DEFAULT_CHARSET))),StringUtil.DEFAULT_CHARSET);
    }

}
