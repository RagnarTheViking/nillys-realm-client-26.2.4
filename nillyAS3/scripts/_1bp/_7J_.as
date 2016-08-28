package _1bp
{
   import flash.utils.Dictionary;
   import _1xa.AppendingLineBuilder;
   
   public class _7J_
   {
      
      static const _0pA_:uint = 65280;
      
      static const _ap:uint = 16711680;
      
      static const _Q_q:uint = 16777103;
      
      static const _12Z_:uint = 11776947;
      
      static const _fO_:uint = 9055202;
       
      
      public var _1U_C_:Dictionary;
      
      public var _no:AppendingLineBuilder;
      
      public var _0N_9:AppendingLineBuilder;
      
      public function _7J_()
      {
         super();
      }
      
      public function _zg(param1:XML, param2:XML) : void
      {
         this._1wj();
         this.compareSlots(param1,param2);
      }
      
      protected function compareSlots(param1:XML, param2:XML) : void
      {
      }
      
      private function _1wj() : void
      {
         this._1U_C_ = new Dictionary();
         this._no = new AppendingLineBuilder();
      }
      
      protected function _0dK_(param1:Number) : uint
      {
         if(param1 < 0)
         {
            return _ap;
         }
         if(param1 > 0)
         {
            return _0pA_;
         }
         return _Q_q;
      }
      
      protected function _6Z_(param1:String, param2:uint = 16777103) : String
      {
         return "<font color=\"#" + param2.toString(16) + "\">" + param1 + "</font>";
      }
      
      protected function __in(param1:String) : String
      {
         return this._6Z_("MP Cost: ",_12Z_) + this._6Z_(param1,_Q_q) + "\n";
      }
   }
}
