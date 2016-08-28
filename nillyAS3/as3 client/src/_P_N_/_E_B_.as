package _P_N_
{
   import _1O_R_.Dialog;
   import flash.text.TextFormatAlign;
   
   public class _E_B_
   {
      
      private static const _B_R_:int = 14;
       
      
      private var _3B_:Dialog;
      
      public function _E_B_(param1:Dialog)
      {
         super();
         this._3B_ = param1;
      }
      
      public function init() : void
      {
         this._3B_._7H_.setColor(Dialog._1I_a);
         this._3B_._R_E_.setHorizontalAlign(TextFormatAlign.CENTER);
         this._3B_._mT_ = 4;
         this._3B_._1H_a = 18;
         this._3B_._1fA_ = 18;
      }
      
      public function drawTitleLine() : void
      {
         this.drawLine(this._3B_._7H_.y + this._3B_._7H_.height + this._3B_._mT_);
      }
      
      public function drawLine(param1:Number) : void
      {
         this._3B_.rect_.graphics.moveTo(1,param1);
         this._3B_.rect_.graphics.beginFill(6710886,1);
         this._3B_.rect_.graphics.drawRect(1,param1,this._3B_._0Y_0 - 2,2);
      }
      
      public function positionText() : void
      {
         this._3B_._R_E_.y = this._3B_._7H_.y + this._3B_._7H_.height + this._3B_._mT_ + _B_R_;
      }
   }
}
