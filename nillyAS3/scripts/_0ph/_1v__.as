package _0ph
{
   import _0J_Q_._09O_;
   import flash.events.IEventDispatcher;
   import flash.events.Event;
   
   public class _1v__ implements _09O_
   {
       
      
      private const _0aZ_:Vector.<_0ph._1mm> = new Vector.<_0ph._1mm>();
      
      private const _0xL_:Vector.<_0ph._1mm> = new Vector.<_0ph._1mm>();
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var _ob:Boolean = false;
      
      public function _1v__(param1:IEventDispatcher)
      {
         super();
         this._eventDispatcher = param1;
      }
      
      public function _0J_e(param1:IEventDispatcher, param2:String, param3:Function, param4:Class = null, param5:Boolean = false, param6:int = 0, param7:Boolean = true) : void
      {
         var eventConfig:_0ph._1mm = null;
         var callback:Function = null;
         var dispatcher:IEventDispatcher = param1;
         var eventString:String = param2;
         var listener:Function = param3;
         var eventClass:Class = param4;
         var useCapture:Boolean = param5;
         var priority:int = param6;
         var useWeakReference:Boolean = param7;
         eventClass = eventClass || Event;
         var currentListeners:Vector.<_0ph._1mm> = !!this._ob?this._0xL_:this._0aZ_;
         var i:int = currentListeners.length - 1;
         while(i >= 0)
         {
            eventConfig = currentListeners[i];
            if(eventConfig.dispatcher == dispatcher && eventConfig.eventString == eventString && eventConfig.listener == listener && eventConfig.useCapture == useCapture && eventConfig.eventClass == eventClass)
            {
               return;
            }
            i--;
         }
         if(eventClass != Event)
         {
            callback = function(param1:Event):void
            {
               routeEventToListener(param1,listener,eventClass);
            };
         }
         else
         {
            callback = listener;
         }
         eventConfig = new _0ph._1mm(dispatcher,eventString,listener,eventClass,callback,useCapture);
         currentListeners.push(eventConfig);
         if(!this._ob)
         {
            dispatcher.addEventListener(eventString,callback,useCapture,priority,useWeakReference);
         }
      }
      
      public function _1W_Y_(param1:IEventDispatcher, param2:String, param3:Function, param4:Class = null, param5:Boolean = false) : void
      {
         var _loc6_:_0ph._1mm = null;
         param4 = param4 || Event;
         var _loc7_:Vector.<_0ph._1mm> = !!this._ob?this._0xL_:this._0aZ_;
         var _loc8_:int = _loc7_.length;
         while(_loc8_--)
         {
            _loc6_ = _loc7_[_loc8_];
            if(_loc6_.dispatcher == param1 && _loc6_.eventString == param2 && _loc6_.listener == param3 && _loc6_.useCapture == param5 && _loc6_.eventClass == param4)
            {
               if(!this._ob)
               {
                  param1.removeEventListener(param2,_loc6_.callback,param5);
               }
               _loc7_.splice(_loc8_,1);
               return;
            }
         }
      }
      
      public function _0tB_() : void
      {
         var _loc1_:_0ph._1mm = null;
         var _loc2_:IEventDispatcher = null;
         var _loc3_:Vector.<_0ph._1mm> = !!this._ob?this._0xL_:this._0aZ_;
         while(_loc1_ = _loc3_.pop())
         {
            if(!this._ob)
            {
               _loc2_ = _loc1_.dispatcher;
               _loc2_.removeEventListener(_loc1_.eventString,_loc1_.callback,_loc1_.useCapture);
            }
         }
      }
      
      public function suspend() : void
      {
         var _loc1_:_0ph._1mm = null;
         var _loc2_:IEventDispatcher = null;
         if(this._ob)
         {
            return;
         }
         this._ob = true;
         while(_loc1_ = this._0aZ_.pop())
         {
            _loc2_ = _loc1_.dispatcher;
            _loc2_.removeEventListener(_loc1_.eventString,_loc1_.callback,_loc1_.useCapture);
            this._0xL_.push(_loc1_);
         }
      }
      
      public function resume() : void
      {
         var _loc1_:_0ph._1mm = null;
         var _loc2_:IEventDispatcher = null;
         if(!this._ob)
         {
            return;
         }
         this._ob = false;
         while(_loc1_ = this._0xL_.pop())
         {
            _loc2_ = _loc1_.dispatcher;
            _loc2_.addEventListener(_loc1_.eventString,_loc1_.callback,_loc1_.useCapture);
            this._0aZ_.push(_loc1_);
         }
      }
      
      private function routeEventToListener(param1:Event, param2:Function, param3:Class) : void
      {
         if(param1 is param3)
         {
            param2(param1);
         }
      }
   }
}
