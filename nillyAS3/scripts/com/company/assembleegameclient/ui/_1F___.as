package com.company.assembleegameclient.ui
{
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import flash.display.IGraphicsData;
   
   public class _1F___ extends _uF_
   {
       
      
      public function _1F___(param1:int)
      {
         super(param1);
      }
      
      protected function initText() : void
      {
         _0I_W_();
         this.draw();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      public function _0D_S_(param1:String) : void
      {
         text_.setStringBuilder(new _dU_().setParams(param1));
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         if(param1 == mouseEnabled)
         {
            return;
         }
         mouseEnabled = param1;
         graphicsData_[0] = !!param1?_jv:_1xo;
         this.draw();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         _jv.color = 16768133;
         this.draw();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         _jv.color = 16777215;
         this.draw();
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.drawGraphicsData(graphicsData_);
      }
   }
}
