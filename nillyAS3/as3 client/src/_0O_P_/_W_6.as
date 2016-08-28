package _0O_P_
{
   import _ki._yx;
   import _0H_6.GameContext;
   import com.company.assembleegameclient.map.Map;
   import com.company.util.IntPoint;
   import com.company.assembleegameclient.objects.GameObject;
   import com.hurlant.util.Base64;
   import flash.utils.ByteArray;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.objects.BasicObject;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _W_6
   {
       
      
      public function _W_6()
      {
         super();
      }
      
      private static function get _0qa() : _yx
      {
         return GameContext.getInjector().getInstance(_yx);
      }
      
      public static function _0A_o(param1:String) : Map
      {
         var _loc2_:Object = _0qa.parse(param1);
         var _loc3_:Map = new Map(null);
         _loc3_.setProps(_loc2_["width"],_loc2_["height"],_loc2_["name"],_loc2_["back"],false,false);
         _loc3_.initialize();
         _I_2(_loc2_,_loc3_,0,0);
         return _loc3_;
      }
      
      public static function _1iv(param1:String, param2:Map, param3:int, param4:int) : void
      {
         var _loc5_:Object = _0qa.parse(param1);
         _I_2(_loc5_,param2,param3,param4);
      }
      
      public static function _1X_Q_(param1:String) : IntPoint
      {
         var _loc2_:Object = _0qa.parse(param1);
         return new IntPoint(_loc2_["width"],_loc2_["height"]);
      }
      
      private static function _I_2(param1:Object, param2:Map, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         var _loc11_:GameObject = null;
         var _loc12_:ByteArray = Base64.decodeToByteArray(param1["data"]);
         _loc12_.uncompress();
         var _loc13_:Array = param1["dict"];
         _loc5_ = param4;
         while(_loc5_ < param4 + param1["height"])
         {
            _loc6_ = param3;
            while(_loc6_ < param3 + param1["width"])
            {
               _loc7_ = _loc13_[_loc12_.readShort()];
               if(!(_loc6_ < 0 || _loc6_ >= param2.width_ || _loc5_ < 0 || _loc5_ >= param2.height_))
               {
                  if(_loc7_.hasOwnProperty("ground"))
                  {
                     _loc9_ = GroundLibrary._07h[_loc7_["ground"]];
                     param2.setGroundTile(_loc6_,_loc5_,_loc9_);
                  }
                  _loc8_ = _loc7_["objs"];
                  if(_loc8_ != null)
                  {
                     for each(_loc10_ in _loc8_)
                     {
                        _loc11_ = _0w2(_loc10_);
                        _loc11_.objectId_ = BasicObject._03v();
                        param2.addObj(_loc11_,_loc6_ + 0.5,_loc5_ + 0.5);
                     }
                  }
               }
               _loc6_++;
            }
            _loc5_++;
         }
      }
      
      public static function _0w2(param1:Object) : GameObject
      {
         var _loc2_:int = ObjectLibrary._07h[param1["id"]];
         var _loc3_:XML = ObjectLibrary.XmlData[_loc2_];
         var _loc4_:GameObject = ObjectLibrary._1zA_(_loc2_);
         _loc4_.size_ = !!param1.hasOwnProperty("size")?int(param1["size"]):int(_loc4_.props_._1X_Q_());
         return _loc4_;
      }
   }
}
