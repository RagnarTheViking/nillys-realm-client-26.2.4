package _1ar
{
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class _R_F_ extends Sprite
   {
       
      
      private var _0N_7:Dictionary;
      
      private var _17y:int = 0;
      
      private var selected_:_1ar._1V_3 = null;
      
      public function _R_F_()
      {
         this._0N_7 = new Dictionary();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function _183() : int
      {
         return this.selected_._0Z_n;
      }
      
      public function _1S_Y_(param1:int) : void
      {
         var _loc2_:_1ar._1V_3 = null;
         var _loc3_:int = 0;
         while(_loc3_ < numChildren)
         {
            _loc2_ = getChildAt(_loc3_) as _1ar._1V_3;
            if(_loc2_ != null)
            {
               if(_loc2_._0Z_n == param1)
               {
                  this.setSelected(_loc2_);
                  return;
               }
            }
            _loc3_++;
         }
      }
      
      protected function setSelected(param1:_1ar._1V_3) : void
      {
         if(this.selected_ != null)
         {
            this.selected_.setSelected(false);
         }
         this.selected_ = param1;
         this.selected_.setSelected(true);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(stage.focus != null)
         {
            return;
         }
         var _loc2_:_1ar._1V_3 = this._0N_7[param1.keyCode];
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.callback_(_loc2_);
      }
      
      protected function _176(param1:String, param2:int, param3:Function, param4:int) : void
      {
         var _loc5_:_1ar._1V_3 = null;
         _loc5_ = new _1ar._1V_3(param1,param3,param4);
         _loc5_.y = this._17y;
         addChild(_loc5_);
         this._0N_7[param2] = _loc5_;
         if(this.selected_ == null)
         {
            this.setSelected(_loc5_);
         }
         this._17y = this._17y + 30;
      }
      
      protected function _1q6() : void
      {
         this._17y = this._17y + 30;
      }
   }
}
