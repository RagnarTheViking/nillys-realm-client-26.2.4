package _7m
{
   import flash.utils.IDataInput;
   
   public class _Q_x
   {
       
      
      public var objectType_:int;
      
      public var _1V_S_:_7m._0vp;
      
      public function _Q_x()
      {
         this._1V_S_ = new _7m._0vp();
         super();
      }
      
      public function parseFromInput(param1:IDataInput) : void
      {
         this.objectType_ = !!WebMain.pserver?int(param1.readUnsignedShort()):int(param1.readShort());
         this._1V_S_.parseFromInput(param1);
      }
      
      public function toString() : String
      {
         return "objectType_: " + this.objectType_ + " status_: " + this._1V_S_;
      }
   }
}
