package _0ib
{
   import _1wl._1D_7;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import _2F_.Console;
   
   public class _k8 extends _05E_
   {
       
      
      private var _0a2:Object;
      
      private var _0u5:uint;
      
      private var _0qu:_1D_7;
      
      private var _1dN_:_1D_7;
      
      private var _1G_p:Boolean;
      
      private var _timer:uint;
      
      public var first:_1D_7;
      
      public var last:_1D_7;
      
      private var _0K_4:uint;
      
      private var _lines:uint;
      
      public function _k8(param1:Console)
      {
         var console:Console = param1;
         super(console);
         this._0a2 = new Object();
         remoter.addEventListener(Event.CONNECT,this._eX_);
         remoter.registerCallback("log",function(param1:ByteArray):void
         {
            registerLog(_1D_7._lD_(param1));
         });
      }
      
      private function _eX_(param1:Event) : void
      {
         var _loc2_:_1D_7 = this.first;
         while(_loc2_)
         {
            this._R_N_(_loc2_);
            _loc2_ = _loc2_.next;
         }
      }
      
      private function _R_N_(param1:_1D_7) : void
      {
         var _loc2_:ByteArray = null;
         if(remoter.canSend)
         {
            _loc2_ = new ByteArray();
            param1._0X_E_(_loc2_);
            remoter.send("log",_loc2_);
         }
      }
      
      public function update(param1:uint) : Boolean
      {
         this._timer = param1;
         if(this._0u5 > 0)
         {
            this._0u5--;
         }
         if(this._1dN_)
         {
            if(this._0qu)
            {
               this.remove(this._0qu);
            }
            this._0qu = this._1dN_;
            this._1dN_ = null;
            this.push(this._0qu);
         }
         var _loc2_:Boolean = this._1G_p;
         this._1G_p = false;
         return _loc2_;
      }
      
      public function add(param1:_1D_7) : void
      {
         this._lines++;
         param1.line = this._lines;
         param1.time = this._timer;
         this.registerLog(param1);
      }
      
      private function registerLog(param1:_1D_7) : void
      {
         this._1G_p = true;
         this.addChannel(param1.ch);
         param1._dj = param1.line + " ";
         param1._F_n = "[<a href=\"event:channel_" + param1.ch + "\">" + param1.ch + "</a>] ";
         param1._0xS_ = config.timeStampFormatter(param1.time) + " ";
         this._R_N_(param1);
         if(param1.repeat)
         {
            if(this._0u5 > 0 && this._0qu)
            {
               param1.line = this._0qu.line;
               this._1dN_ = param1;
               return;
            }
            this._0u5 = config.maxRepeats;
            this._0qu = param1;
         }
         this.push(param1);
         while(this._0K_4 > config.maxLines && config.maxLines > 0)
         {
            this.remove(this.first);
         }
         if(config.tracing && config.traceCall != null)
         {
            config.traceCall(param1.ch,param1.plainText(),param1.priority);
         }
      }
      
      public function clear(param1:String = null) : void
      {
         var _loc2_:_1D_7 = null;
         if(param1)
         {
            _loc2_ = this.first;
            while(_loc2_)
            {
               if(_loc2_.ch == param1)
               {
                  this.remove(_loc2_);
               }
               _loc2_ = _loc2_.next;
            }
            delete this._0a2[param1];
         }
         else
         {
            this.first = null;
            this.last = null;
            this._0K_4 = 0;
            this._0a2 = new Object();
         }
      }
      
      public function getLogsAsString(param1:String, param2:Boolean = true, param3:Function = null) : String
      {
         var _loc4_:* = "";
         var _loc5_:_1D_7 = this.first;
         while(_loc5_)
         {
            if(param3 == null || param3(_loc5_))
            {
               if(this.first != _loc5_)
               {
                  _loc4_ = _loc4_ + param1;
               }
               _loc4_ = _loc4_ + (!!param2?_loc5_.toString():_loc5_.plainText());
            }
            _loc5_ = _loc5_.next;
         }
         return _loc4_;
      }
      
      public function getChannels() : Array
      {
         var _loc1_:* = null;
         var _loc2_:Array = new Array(Console._z4);
         this._xR_(Console._0M_x,_loc2_);
         this._xR_(Console._0Z_Y_,_loc2_);
         this._xR_(_1R_M_._0yJ_,_loc2_);
         this._xR_(Console._B_G_,_loc2_);
         var _loc3_:Array = new Array();
         for(_loc1_ in this._0a2)
         {
            if(_loc2_.indexOf(_loc1_) < 0)
            {
               _loc3_.push(_loc1_);
            }
         }
         return _loc2_.concat(_loc3_.sort(Array.CASEINSENSITIVE));
      }
      
      private function _xR_(param1:String, param2:Array) : void
      {
         if(this._0a2.hasOwnProperty(param1))
         {
            param2.push(param1);
         }
      }
      
      public function _1a__() : void
      {
         this._0a2 = new Object();
         var _loc1_:_1D_7 = this.first;
         while(_loc1_)
         {
            this.addChannel(_loc1_.ch);
            _loc1_ = _loc1_.next;
         }
      }
      
      public function addChannel(param1:String) : void
      {
         this._0a2[param1] = null;
      }
      
      private function push(param1:_1D_7) : void
      {
         if(this.last == null)
         {
            this.first = param1;
         }
         else
         {
            this.last.next = param1;
            param1._17R_ = this.last;
         }
         this.last = param1;
         this._0K_4++;
      }
      
      private function remove(param1:_1D_7) : void
      {
         if(this.first == param1)
         {
            this.first = param1.next;
         }
         if(this.last == param1)
         {
            this.last = param1._17R_;
         }
         if(param1 == this._0qu)
         {
            this._0qu = null;
         }
         if(param1 == this._1dN_)
         {
            this._1dN_ = null;
         }
         if(param1.next != null)
         {
            param1.next._17R_ = param1._17R_;
         }
         if(param1._17R_ != null)
         {
            param1._17R_.next = param1.next;
         }
         this._0K_4--;
      }
   }
}
