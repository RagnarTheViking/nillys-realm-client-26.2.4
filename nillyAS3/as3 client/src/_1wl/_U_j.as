package _1wl
{
   import flash.utils.ByteArray;
   import _0ib.Executer;
   
   public class _U_j
   {
       
      
      private var _1O_5:_1wl._0v6;
      
      public var _1R_S_:String;
      
      private var _b5:Boolean;
      
      public var key:String;
      
      public var col:Number;
      
      public var v:Number;
      
      public var avg:Number;
      
      public function _U_j(param1:String = "", param2:Number = 0)
      {
         super();
         this.col = param2;
         this.key = param1;
      }
      
      public static function _lD_(param1:ByteArray) : _U_j
      {
         var _loc2_:_U_j = new _U_j(param1.readUTF(),param1.readUnsignedInt());
         _loc2_.v = param1.readDouble();
         _loc2_.avg = param1.readDouble();
         return _loc2_;
      }
      
      public function setObject(param1:Object, param2:String) : Number
      {
         this._1O_5 = new _1wl._0v6(param1);
         this._1R_S_ = param2;
         this._b5 = this._1R_S_.search(/[^\w\d]/) >= 0;
         this.v = this._tq();
         this.avg = this.v;
         return this.v;
      }
      
      public function get obj() : Object
      {
         return this._1O_5 != null?this._1O_5._1G_a:undefined;
      }
      
      public function get prop() : String
      {
         return this._1R_S_;
      }
      
      public function _tq() : Number
      {
         return !!this._b5?Number(Executer._Z_9(this.obj,this._1R_S_)):Number(this.obj[this._1R_S_]);
      }
      
      public function setValue(param1:Number, param2:uint = 0) : void
      {
         this.v = param1;
         if(param2 > 0)
         {
            if(isNaN(this.avg))
            {
               this.avg = this.v;
            }
            else
            {
               this.avg = this.avg + (this.v - this.avg) / param2;
            }
         }
      }
      
      public function _0X_E_(param1:ByteArray) : void
      {
         param1.writeUTF(this.key);
         param1.writeUnsignedInt(this.col);
         param1.writeDouble(this.v);
         param1.writeDouble(this.avg);
      }
   }
}
