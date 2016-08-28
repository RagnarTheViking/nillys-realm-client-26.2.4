package _Y_8
{
   import flash.display.Sprite;
   import _05L_._05T_;
   import flash.events.Event;
   
   public class Chat extends Sprite
   {
       
      
      public var list:_Y_8._0Y_d;
      
      private var input:_Y_8._vv;
      
      private var _li:_Y_8._bV_;
      
      private var model:_05T_;
      
      public function Chat()
      {
         super();
         mouseEnabled = true;
         mouseChildren = true;
         this.list = new _Y_8._0Y_d();
         addChild(this.list);
      }
      
      public function setup(param1:_05T_, param2:Boolean) : void
      {
         this.model = param1;
         this.y = 600 - param1.chat.height;
         this.list.y = param1.chat.height;
         if(param2)
         {
            this._0cs();
         }
         else
         {
            this._06D_();
         }
         stage.dispatchEvent(new Event(Event.RESIZE));
      }
      
      private function _0cs() : void
      {
         this.input = new _Y_8._vv();
         addChild(this.input);
      }
      
      private function _06D_() : void
      {
         this._li = new _Y_8._bV_();
         addChild(this._li);
         this.list.y = this.model.chat.height - this.model._A_x;
      }
      
      public function _Q_D_() : void
      {
         if(this._li != null && contains(this._li))
         {
            removeChild(this._li);
         }
         if(this.input == null || !contains(this.input))
         {
            this._0cs();
         }
      }
   }
}
