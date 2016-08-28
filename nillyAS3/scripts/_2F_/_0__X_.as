package _2F_
{
   public class _0__X_
   {
       
      
      public var keystrokePassword:String;
      
      public var remotingPassword:String;
      
      public var maxLines:uint = 1000;
      
      public var maxRepeats:int = 75;
      
      public var _0O_w:int;
      
      public var _1uD_:int = 2;
      
      public var useObjectLinking:Boolean = true;
      
      public var objectHardReferenceTimer:uint = 0;
      
      public var tracing:Boolean;
      
      public var traceCall:Function;
      
      public var showTimestamp:Boolean = false;
      
      public var timeStampFormatter:Function;
      
      public var showLineNumber:Boolean = false;
      
      public var remotingConnectionName:String = "_Console";
      
      public var allowedRemoteDomain:String = "*";
      
      public var commandLineAllowed:Boolean;
      
      public var commandLineAutoScope:Boolean;
      
      public var commandLineInputPassThrough:Function;
      
      public var commandLineAutoCompleteEnabled:Boolean = true;
      
      public var keyBindsEnabled:Boolean = true;
      
      public var displayRollerEnabled:Boolean = true;
      
      public var rulerToolEnabled:Boolean = true;
      
      public var _0I_F_:Boolean = true;
      
      public var _1oD_:String = "com.junkbyte/Console/UserData";
      
      public var _1V_k:String = "/";
      
      public var rememberFilterSettings:Boolean;
      
      public var _7E_:Boolean = true;
      
      private var _1iA_:_2F_._wR_;
      
      public function _0__X_()
      {
         this._0O_w = Console.FATAL;
         this.traceCall = function(param1:String, param2:String, ... rest):void
         {
         };
         this.timeStampFormatter = function(param1:uint):String
         {
            var _loc2_:uint = param1 * 0.001;
            return this._193(_loc2_ / 60) + ":" + this._193(_loc2_ % 60);
         };
         super();
         this._1iA_ = new _2F_._wR_();
      }
      
      private function _193(param1:uint) : String
      {
         if(param1 < 10)
         {
            return "0" + param1;
         }
         return String(param1);
      }
      
      public function get style() : _2F_._wR_
      {
         return this._1iA_;
      }
   }
}
