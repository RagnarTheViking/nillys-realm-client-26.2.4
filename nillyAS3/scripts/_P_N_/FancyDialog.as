package _P_N_
{
   import _1O_R_.Dialog;
   
   public class FancyDialog extends Dialog
   {
       
      
      protected var _0q__:_P_N_._E_B_;
      
      public function FancyDialog(param1:String, param2:String, param3:String, param4:String, param5:String)
      {
         this._0q__ = new _P_N_._E_B_(this);
         super(param1,param2,param3,param4,param5);
         this._0q__.init();
      }
      
      override protected function drawAdditionalUI() : void
      {
         this._0q__.positionText();
      }
      
      override protected function drawGraphicsTemplate() : void
      {
         this._0q__.drawTitleLine();
      }
   }
}
