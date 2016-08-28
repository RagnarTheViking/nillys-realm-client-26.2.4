package _0rQ_
{
   import _aW_.IWebRequest;
   import _aW_._K_Y_;
   import _2l.ClientSettings;
   import _f7._0K_8;
   import flash.net.URLLoaderDataFormat;
   
   public class _0H_t implements IWebRequest
   {
       
      
      [Inject]
      public var loader:_K_Y_;
      
      [Inject]
      public var setup:ClientSettings;
      
      private var _1c__:Boolean;
      
      private var _h:int;
      
      private var dataFormat:String;
      
      public function _0H_t()
      {
         super();
         this._1c__ = true;
         this._h = 0;
         this.dataFormat = URLLoaderDataFormat.TEXT;
      }
      
      public function get complete() : _0K_8
      {
         return this.loader.complete;
      }
      
      public function _gP_(param1:String) : void
      {
         this.loader._gP_(param1);
      }
      
      public function _pp(param1:Boolean) : void
      {
         this._1c__ = param1;
      }
      
      public function _R_L_(param1:int) : void
      {
         this.loader._R_L_(param1);
      }
      
      public function sendRequest(param1:String, param2:Object) : void
      {
         this.loader.sendRequest(this._0S_o(param1),param2);
      }
      
      private function _0S_o(param1:String) : String
      {
         if(param1.charAt(0) != "/")
         {
            param1 = "/" + param1;
         }
         return this.setup.HttpServerAddress() + param1;
      }
      
      public function _1ru() : Boolean
      {
         return this.loader._A_B_();
      }
   }
}
