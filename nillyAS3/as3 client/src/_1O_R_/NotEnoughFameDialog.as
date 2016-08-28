package _1O_R_
{
   import flash.events.Event;
   import _C_._1O_I_;
   
   public class NotEnoughFameDialog extends Dialog
   {
       
      
      public function NotEnoughFameDialog()
      {
         super(_1O_I_._05p,_1O_I_._05h,_1O_I_._03J_,null,"/notEnoughFame");
         addEventListener(LEFT_BUTTON,this._174);
      }
      
      public function _174(param1:Event) : void
      {
         parent.removeChild(this);
      }
   }
}
