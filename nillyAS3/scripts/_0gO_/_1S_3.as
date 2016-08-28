package _0gO_
{
   import flash.display3D.VertexBuffer3D;
   import flash.utils.Dictionary;
   import flash.display3D.Context3D;
   import flash.utils.ByteArray;
   
   public class _1S_3
   {
       
      
      public var name:String;
      
      public var _4P_:Vector.<_0gO_._1W_5>;
      
      public var _1uG_:VertexBuffer3D;
      
      protected var _08R_:Dictionary;
      
      protected var _0W_l:uint;
      
      protected var _0up:Dictionary;
      
      protected var _1B_x:Vector.<Number>;
      
      public function _1S_3()
      {
         super();
         this._4P_ = new Vector.<_0gO_._1W_5>();
         this._08R_ = new Dictionary();
         this._1B_x = new Vector.<Number>();
      }
      
      public function dispose() : void
      {
         var _loc1_:_0gO_._1W_5 = null;
         for each(_loc1_ in this._4P_)
         {
            _loc1_.dispose();
         }
         this._4P_.length = 0;
         if(this._1uG_ !== null)
         {
            this._1uG_.dispose();
            this._1uG_ = null;
         }
         this._1B_x.length = 0;
         this._0W_l = 0;
         this._0up = new Dictionary();
      }
      
      public function _0J_H_(param1:Context3D) : void
      {
         var _loc2_:_0gO_._1W_5 = null;
         for each(_loc2_ in this._4P_)
         {
            if(_loc2_._0O_i.length > 0)
            {
               _loc2_._1Q_H_ = param1.createIndexBuffer(_loc2_._0O_i.length);
               _loc2_._1Q_H_.uploadFromVector(_loc2_._0O_i,0,_loc2_._0O_i.length);
               _loc2_._0V_r = null;
            }
         }
         this._1uG_ = param1.createVertexBuffer(this._1B_x.length / 8,8);
         this._1uG_.uploadFromVector(this._1B_x,0,this._1B_x.length / 8);
      }
      
      public function readBytes(param1:ByteArray) : void
      {
         var _loc2_:Vector.<String> = null;
         var _loc3_:_0gO_._1W_5 = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.dispose();
         var _loc9_:* = "";
         var _loc10_:Vector.<Number> = new Vector.<Number>();
         var _loc11_:Vector.<Number> = new Vector.<Number>();
         var _loc12_:Vector.<Number> = new Vector.<Number>();
         param1.position = 0;
         var _loc13_:String = param1.readUTFBytes(param1.bytesAvailable);
         var _loc14_:Array = _loc13_.split(/[\r\n]+/);
         for each(_loc4_ in _loc14_)
         {
            _loc4_ = _loc4_.replace(/^\s*|\s*$/g,"");
            if(!(_loc4_ == "" || _loc4_.charAt(0) === "#"))
            {
               _loc5_ = _loc4_.split(/\s+/);
               switch(_loc5_[0].toLowerCase())
               {
                  case "v":
                     _loc10_.push(parseFloat(_loc5_[1]),parseFloat(_loc5_[2]),parseFloat(_loc5_[3]));
                     continue;
                  case "vn":
                     _loc11_.push(parseFloat(_loc5_[1]),parseFloat(_loc5_[2]),parseFloat(_loc5_[3]));
                     continue;
                  case "vt":
                     _loc12_.push(parseFloat(_loc5_[1]),1 - parseFloat(_loc5_[2]));
                     continue;
                  case "f":
                     _loc2_ = new Vector.<String>();
                     for each(_loc6_ in _loc5_.slice(1))
                     {
                        _loc2_.push(_loc6_);
                     }
                     if(_loc3_ === null)
                     {
                        _loc3_ = new _0gO_._1W_5(null,_loc9_);
                        this._4P_.push(_loc3_);
                     }
                     _loc3_._0V_r.push(_loc2_);
                     continue;
                  case "g":
                     _loc3_ = new _0gO_._1W_5(_loc5_[1],_loc9_);
                     this._4P_.push(_loc3_);
                     continue;
                  case "o":
                     this.name = _loc5_[1];
                     continue;
                  case "mtllib":
                     continue;
                  case "usemtl":
                     _loc9_ = _loc5_[1];
                     if(_loc3_ !== null)
                     {
                        _loc3_._0vF_ = _loc9_;
                     }
                     continue;
                  default:
                     continue;
               }
            }
            else
            {
               continue;
            }
         }
         for each(_loc3_ in this._4P_)
         {
            _loc3_._0O_i.length = 0;
            for each(_loc2_ in _loc3_._0V_r)
            {
               _loc7_ = _loc2_.length - 1;
               _loc8_ = 1;
               while(_loc8_ < _loc7_)
               {
                  _loc3_._0O_i.push(this._0fa(_loc2_[_loc8_],_loc10_,_loc11_,_loc12_));
                  _loc3_._0O_i.push(this._0fa(_loc2_[0],_loc10_,_loc11_,_loc12_));
                  _loc3_._0O_i.push(this._0fa(_loc2_[_loc8_ + 1],_loc10_,_loc11_,_loc12_));
                  _loc8_++;
               }
            }
            _loc3_._0V_r = null;
         }
         this._0W_l = 0;
         this._0up = null;
      }
      
      protected function _0fa(param1:String, param2:Vector.<Number>, param3:Vector.<Number>, param4:Vector.<Number>) : uint
      {
         var _loc5_:Array = null;
         var _loc6_:uint = 0;
         if(this._0up[param1] !== undefined)
         {
            return this._0up[param1];
         }
         _loc5_ = param1.split("/");
         _loc6_ = parseInt(_loc5_[0],10) - 1;
         this._1B_x.push(param2[_loc6_ * 3 + 0],param2[_loc6_ * 3 + 1],param2[_loc6_ * 3 + 2]);
         if(_loc5_.length > 2 && _loc5_[2].length > 0)
         {
            _loc6_ = parseInt(_loc5_[2],10) - 1;
            this._1B_x.push(param3[_loc6_ * 3 + 0],param3[_loc6_ * 3 + 1],param3[_loc6_ * 3 + 2]);
         }
         else
         {
            this._1B_x.push(0,0,0);
         }
         if(_loc5_.length > 1 && _loc5_[1].length > 0)
         {
            _loc6_ = parseInt(_loc5_[1],10) - 1;
            this._1B_x.push(param4[_loc6_ * 2 + 0],param4[_loc6_ * 2 + 1]);
         }
         else
         {
            this._1B_x.push(0,0);
         }
         return this._0up[param1] = this._0W_l++;
      }
   }
}
