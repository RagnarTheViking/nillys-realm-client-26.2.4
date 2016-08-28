package _uO_
{
   import _1O_R_.Dialog;
   
   public class _0X_U_ implements _0N_w
   {
      
      private static const _0zB_:String = "There are currently no testing servers available. Please play on <font color=\"#7777EE\"><a href=\"http://www.realmofthemadgod.com/\">www.realmofthemadgod.com</a></font>.";
      
      private static const TITLE:String = "No Testing Servers";
      
      private static const _0yE_:String = "/noTestingServers";
       
      
      public function _0X_U_()
      {
         super();
      }
      
      public function _F_Y_() : Dialog
      {
         return new Dialog(TITLE,_0zB_,null,null,_0yE_);
      }
   }
}
