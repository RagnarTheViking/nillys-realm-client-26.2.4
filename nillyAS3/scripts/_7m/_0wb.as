package _7m
{
   import flash.utils.IDataInput;
   
   public class _0wb
   {
       
      
      public var item_:int;
      
      public var _1fS_:int;
      
      public var _3e:Boolean;
      
      public var included_:Boolean;
      
      public function _0wb()
      {
         super();
      }
      
      public function parseFromInput(param1:IDataInput) : void
      {
         this.item_ = param1.readInt();
         this._1fS_ = param1.readInt();
         this._3e = param1.readBoolean();
         this.included_ = param1.readBoolean();
      }
      
      public function toString() : String
      {
         return "item: " + this.item_ + " slotType: " + this._1fS_ + " tradeable: " + this._3e + " included:" + this.included_;
      }
   }
}
