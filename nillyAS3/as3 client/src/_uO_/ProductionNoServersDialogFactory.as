package _uO_
{
   import _1O_R_.Dialog;
   import _C_._1O_I_;
   
   public class ProductionNoServersDialogFactory implements _0N_w
   {
      
      private static const forums_link:String = "<font color=\"#7777EE\"><a href=\"http://nillysrealm.com/\">nillysrealm.com</a></font>";
       
      
      public function ProductionNoServersDialogFactory()
      {
         super();
      }
      
      public function _F_Y_() : Dialog
      {
         var _loc1_:Dialog = new Dialog(_1O_I_._ck,"",null,null,null,null,240);
         _loc1_._R_E_.setHTML(true);
         _loc1_._1aO_(_1O_I_._0J_C_,{"forums_link":forums_link});
         return _loc1_;
      }
   }
}
