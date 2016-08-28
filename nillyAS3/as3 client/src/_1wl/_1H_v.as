package _1wl
{
   import flash.utils.ByteArray;
   import flash.geom.Rectangle;
   
   public class _1H_v
   {
      
      public static const _1C_F_:uint = 1;
      
      public static const _06g:uint = 2;
       
      
      public var type:uint;
      
      public var name:String;
      
      public var _tE_:int = 1;
      
      public var low:Number;
      
      public var _k4:Number;
      
      public var fixed:Boolean;
      
      public var _1kl:uint;
      
      public var _14u:Boolean;
      
      public var interests:Array;
      
      public var rect:Rectangle;
      
      public var _1vS_:int;
      
      public function _1H_v(param1:String)
      {
         this.interests = [];
         super();
         this.name = param1;
      }
      
      public static function _lD_(param1:ByteArray) : _1H_v
      {
         var _loc2_:_1H_v = new _1H_v(param1.readUTF());
         _loc2_.type = param1.readUnsignedInt();
         _loc2_._1vS_ = param1.readUnsignedInt();
         _loc2_.low = param1.readDouble();
         _loc2_._k4 = param1.readDouble();
         _loc2_._14u = param1.readBoolean();
         var _loc3_:uint = param1.readUnsignedInt();
         while(_loc3_)
         {
            _loc2_.interests.push(_U_j._lD_(param1));
            _loc3_--;
         }
         return _loc2_;
      }
      
      public function _tb(param1:Number) : void
      {
         if(!isNaN(param1) && !this.fixed)
         {
            if(isNaN(this.low))
            {
               this.low = param1;
               this._k4 = param1;
            }
            if(param1 > this._k4)
            {
               this._k4 = param1;
            }
            if(param1 < this.low)
            {
               this.low = param1;
            }
         }
      }
      
      public function _0X_E_(param1:ByteArray) : void
      {
         var _loc2_:_U_j = null;
         param1.writeUTF(this.name);
         param1.writeUnsignedInt(this.type);
         param1.writeUnsignedInt(this._1vS_);
         param1.writeDouble(this.low);
         param1.writeDouble(this._k4);
         param1.writeBoolean(this._14u);
         param1.writeUnsignedInt(this.interests.length);
         for each(_loc2_ in this.interests)
         {
            _loc2_._0X_E_(param1);
         }
      }
   }
}
