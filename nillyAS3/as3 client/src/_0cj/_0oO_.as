package _0cj
{
   import flash.utils.getDefinitionByName;
   import _0f._1iK_;
   import _0f._0D_L_;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class _0oO_
   {
      
      private static const _jC_:Boolean = _W_h();
      
      private static var _1hJ_:Class;
       
      
      private var _factory:_1iK_;
      
      public function _0oO_(param1:_1iK_)
      {
         super();
         this._factory = param1;
         this._factory.addEventListener(_0D_L_._0xW_,this._0hb);
         this._factory.addEventListener(_0D_L_._0V_K_,this._1aT_);
      }
      
      private static function _W_h() : Boolean
      {
         try
         {
            _1hJ_ = getDefinitionByName("mx.core::UIComponent") as Class;
         }
         catch(error:Error)
         {
         }
         return _1hJ_ != null;
      }
      
      private function _0hb(param1:_0D_L_) : void
      {
         var mediator:Object = null;
         var displayObject:DisplayObject = null;
         var event:_0D_L_ = param1;
         mediator = event.mediator;
         displayObject = event.view as DisplayObject;
         if(!displayObject)
         {
            this._7P_(event.view,mediator);
            return;
         }
         displayObject.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         if(_jC_ && displayObject is _1hJ_ && !displayObject["initialized"])
         {
            displayObject.addEventListener("creationComplete",function(param1:Event):void
            {
               displayObject.removeEventListener("creationComplete",arguments.callee);
               if(_factory._1bg(displayObject,event.mapping))
               {
                  _7P_(displayObject,mediator);
               }
            });
         }
         else
         {
            this._7P_(displayObject,mediator);
         }
      }
      
      private function _1aT_(param1:_0D_L_) : void
      {
         var _loc2_:DisplayObject = param1.view as DisplayObject;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         }
         if(param1.mediator)
         {
            this._1J_g(param1.mediator);
         }
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._factory._rD_(param1.target);
      }
      
      private function _7P_(param1:Object, param2:Object) : void
      {
         if(param2.hasOwnProperty("viewComponent"))
         {
            param2.viewComponent = param1;
         }
         if(param2.hasOwnProperty("initialize"))
         {
            param2.initialize();
         }
      }
      
      private function _1J_g(param1:Object) : void
      {
         if(param1.hasOwnProperty("destroy"))
         {
            param1.destroy();
         }
      }
   }
}
