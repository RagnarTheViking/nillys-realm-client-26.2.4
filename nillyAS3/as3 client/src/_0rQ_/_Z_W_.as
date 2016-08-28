package _0rQ_
{
   import _aW_._K_Y_;
   import _f7._0K_8;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.getTimer;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.Event;
   import flash.net.URLLoaderDataFormat;
   
   public class _Z_W_ implements _K_Y_
   {
       
      
      private const _1et:_0K_8 = new _0K_8(Boolean);
      
      private var _h:int;
      
      private var dataFormat:String;
      
      private var url:String;
      
      private var params:Object;
      
      private var _9Z_:URLRequest;
      
      private var _0qJ_:URLStream;
      
      private var _1sH_:int;
      
      private var _C_X_:Boolean;
      
      private var data:ByteArray;
      
      public function _Z_W_()
      {
         super();
         this._C_X_ = false;
         this._h = 0;
         this.dataFormat = URLLoaderDataFormat.TEXT;
      }
      
      public function get complete() : _0K_8
      {
         return this._1et;
      }
      
      public function _A_B_() : Boolean
      {
         return this._C_X_;
      }
      
      public function _gP_(param1:String) : void
      {
         this.dataFormat = param1;
      }
      
      public function _R_L_(param1:int) : void
      {
         this._h = param1;
      }
      
      public function sendRequest(param1:String, param2:Object) : void
      {
         this.url = param1;
         this.params = param2;
         this._1sH_ = this._h;
         this._C_X_ = true;
         this._yu();
      }
      
      private function _yu() : void
      {
         this.data = new ByteArray();
         this._fJ_();
         this._9Z_ = this._Y_J_();
         this._0qJ_ = this._08c();
         this._0qJ_.load(this._9Z_);
      }
      
      private function _Y_J_() : URLRequest
      {
         var _loc1_:URLRequest = new URLRequest(this.url);
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = this._0po();
         return _loc1_;
      }
      
      private function _0po() : URLVariables
      {
         var _loc1_:* = null;
         var _loc2_:URLVariables = new URLVariables();
         _loc2_.ignore = getTimer();
         for(_loc1_ in this.params)
         {
            _loc2_[_loc1_] = this.params[_loc1_];
         }
         if(!WebMain.debug)
         {
         }
         return _loc2_;
      }
      
      private function _08c() : URLStream
      {
         var _loc1_:URLStream = new URLStream();
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         _loc1_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         _loc1_.addEventListener(Event.COMPLETE,this.onComplete);
         return _loc1_;
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         this._0gW_(param1.text);
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         this._C_X_ = false;
         this._18p(false,"Security Error");
      }
      
      private function _0gW_(param1:String) : void
      {
         if(this._1sH_-- > 0)
         {
            this._yu();
         }
         else
         {
            this._18p(false,param1);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         this._C_X_ = false;
         this._0qJ_.readBytes(this.data,0,this._0qJ_.bytesAvailable);
         try
         {
            this.data.inflate();
         }
         catch(e:Error)
         {
         }
         if(this.dataFormat == URLLoaderDataFormat.TEXT)
         {
            this.data.position = 0;
            this._K_w(this.data.readUTFBytes(this.data.length));
         }
         else
         {
            this._18p(true,this.data);
         }
      }
      
      private function _K_w(param1:String) : void
      {
         if(param1.substring(0,7) == "<Error>")
         {
            this._0gW_(param1);
         }
         else if(param1.substring(0,12) == "<FatalError>")
         {
            this._18p(false,param1);
         }
         else
         {
            this._18p(true,param1);
         }
      }
      
      private function _18p(param1:Boolean, param2:*) : void
      {
         if(!param1 && param2 is String)
         {
            param2 = this._pO_(param2);
         }
         this._fJ_();
         this._1et.dispatch(param1,param2);
      }
      
      private function _pO_(param1:String) : String
      {
         var _loc2_:Array = param1.match("<.*>(.*)</.*>");
         return _loc2_ && _loc2_.length > 1?_loc2_[1]:param1;
      }
      
      private function _fJ_() : void
      {
         if(this._0qJ_)
         {
            this._0qJ_.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this._0qJ_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this._0qJ_.removeEventListener(Event.COMPLETE,this.onComplete);
            this._0k__();
            this._0qJ_ = null;
         }
      }
      
      private function _0k__() : void
      {
         try
         {
            this._0qJ_.close();
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
   }
}
