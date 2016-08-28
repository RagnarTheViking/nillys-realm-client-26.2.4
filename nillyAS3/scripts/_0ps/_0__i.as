package _0ps
{
   import flash.utils.*;
   import _K_m._0xu;
   import _K_m._1X_j;
   import _K_m._L_d;
   import _K_m._1A_e;
   import _K_m._1J_K_;
   import _K_m._1V_x;
   import _K_m._nm;
   import _wi._1F_t;
   
   public class _0__i extends _1K_D_ implements _X_L_
   {
       
      
      private var _0eE_:XML;
      
      public function _0__i()
      {
         super();
      }
      
      public function _0K_N_(param1:Class, param2:Class) : Boolean
      {
         var type:Class = param1;
         var superType:Class = param2;
         if(type == superType)
         {
            return true;
         }
         var factoryDescription:XML = describeType(type).factory[0];
         return factoryDescription.children().(name() == "implementsInterface" || name() == "extendsClass").(attribute("type") == getQualifiedClassName(superType)).length() > 0;
      }
      
      public function _1B_K_(param1:Class) : _0xu
      {
         this._0eE_ = describeType(param1).factory[0];
         var _loc2_:_0xu = new _0xu(false);
         this._e7(_loc2_,param1);
         this._A_(_loc2_);
         this._0vR_(_loc2_);
         this._zR_(_loc2_);
         this._0H_B_(_loc2_);
         this._0eE_ = null;
         return _loc2_;
      }
      
      private function _e7(param1:_0xu, param2:Class) : void
      {
         var injectParameters:Dictionary = null;
         var parameters:Array = null;
         var description:_0xu = param1;
         var type:Class = param2;
         var node:XML = this._0eE_.constructor[0];
         if(!node)
         {
            if(this._0eE_.parent().@name == "Object" || this._0eE_.extendsClass.length() > 0)
            {
               description.ctor = new _1X_j();
            }
            return;
         }
         injectParameters = this._K_8(node.parent().metadata.arg);
         var parameterNames:Array = (injectParameters.name || "").split(",");
         var parameterNodes:XMLList = node.parameter;
         if(parameterNodes.(@type == "*").length() == parameterNodes.@type.length())
         {
            this._aq(node,type);
         }
         parameters = this._1zp(parameterNodes,parameterNames);
         var requiredParameters:uint = parameters.required;
         delete parameters.required;
         description.ctor = new _L_d(parameters,requiredParameters,injectParameters);
      }
      
      private function _K_8(param1:XMLList) : Dictionary
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc6_:int = 0;
         var _loc4_:Dictionary = new Dictionary();
         var _loc5_:uint = param1.length();
         while(_loc6_ < _loc5_)
         {
            _loc2_ = param1[_loc6_];
            _loc3_ = _loc2_.@key;
            _loc4_[_loc3_] = !!_loc4_[_loc3_]?_loc4_[_loc3_] + "," + _loc2_.attribute("value"):_loc2_.attribute("value");
            _loc6_++;
         }
         return _loc4_;
      }
      
      private function _A_(param1:_0xu) : void
      {
         var node:XML = null;
         var mappingId:String = null;
         var propertyName:String = null;
         var injectParameters:Dictionary = null;
         var injectionPoint:_1A_e = null;
         var description:_0xu = param1;
         for each(node in this._0eE_.*.(name() == "variable" || name() == "accessor").metadata.(@name == "Inject"))
         {
            mappingId = node.parent().@type + "|" + node.arg.(@key == "name").attribute("value");
            propertyName = node.parent().@name;
            injectParameters = this._K_8(node.arg);
            injectionPoint = new _1A_e(mappingId,propertyName,injectParameters.optional == "true",injectParameters);
            description._1L_I_(injectionPoint);
         }
      }
      
      private function _0vR_(param1:_0xu) : void
      {
         var node:XML = null;
         var injectParameters:Dictionary = null;
         var parameterNames:Array = null;
         var parameters:Array = null;
         var requiredParameters:uint = 0;
         var injectionPoint:_1J_K_ = null;
         var description:_0xu = param1;
         for each(node in this._0eE_.method.metadata.(@name == "Inject"))
         {
            injectParameters = this._K_8(node.arg);
            parameterNames = (injectParameters.name || "").split(",");
            parameters = this._1zp(node.parent().parameter,parameterNames);
            requiredParameters = parameters.required;
            delete parameters.required;
            injectionPoint = new _1J_K_(node.parent().@name,parameters,requiredParameters,injectParameters.optional == "true",injectParameters);
            description._1L_I_(injectionPoint);
         }
      }
      
      private function _zR_(param1:_0xu) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = this._1S_I_(_1V_x,"PostConstruct");
         var _loc4_:int = _loc2_.length;
         while(_loc3_ < _loc4_)
         {
            param1._1L_I_(_loc2_[_loc3_]);
            _loc3_++;
         }
      }
      
      private function _0H_B_(param1:_0xu) : void
      {
         var _loc2_:Array = this._1S_I_(_nm,"PreDestroy");
         if(!_loc2_.length)
         {
            return;
         }
         param1._eG_ = _loc2_[0];
         param1._eG_.last = _loc2_[0];
         var _loc3_:int = 1;
         var _loc4_:int = _loc2_.length;
         while(_loc3_ < _loc4_)
         {
            param1._eG_.last.next = _loc2_[_loc3_];
            param1._eG_.last = _loc2_[_loc3_];
            _loc3_++;
         }
      }
      
      private function _1zp(param1:XMLList, param2:Array) : Array
      {
         var _loc3_:uint = 0;
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:* = false;
         var _loc8_:uint = 0;
         var _loc10_:int = 0;
         _loc3_ = param1.length();
         var _loc9_:Array = new Array(_loc3_);
         while(_loc10_ < _loc3_)
         {
            _loc4_ = param1[_loc10_];
            _loc5_ = param2[_loc10_] || "";
            _loc6_ = _loc4_.@type;
            _loc7_ = _loc4_.@optional == "true";
            if(_loc6_ == "*")
            {
               if(!_loc7_)
               {
                  throw new _1F_t("Error in method definition of injectee \"" + this._0eE_.@type + "Required parameters can\'t have type \"*\".");
               }
               _loc6_ = null;
            }
            if(!_loc7_)
            {
               _loc8_++;
            }
            _loc9_[_loc10_] = _loc6_ + "|" + _loc5_;
            _loc10_++;
         }
         _loc9_.required = _loc8_;
         return _loc9_;
      }
      
      private function _1S_I_(param1:Class, param2:String) : Array
      {
         var node:XML = null;
         var injectParameters:Dictionary = null;
         var parameterNames:Array = null;
         var parameters:Array = null;
         var requiredParameters:uint = 0;
         var order:Number = NaN;
         var injectionPointType:Class = param1;
         var tag:String = param2;
         var injectionPoints:Array = [];
         for each(node in this._0eE_..metadata.(@name == tag))
         {
            injectParameters = this._K_8(node.arg);
            parameterNames = (injectParameters.name || "").split(",");
            parameters = this._1zp(node.parent().parameter,parameterNames);
            requiredParameters = parameters.required;
            delete parameters.required;
            order = parseInt(node.arg.(@key == "order").@value);
            injectionPoints.push(new injectionPointType(node.parent().@name,parameters,requiredParameters,!!isNaN(order)?int.MAX_VALUE:order));
         }
         if(injectionPoints.length > 0)
         {
            injectionPoints.sortOn("order",Array.NUMERIC);
         }
         return injectionPoints;
      }
      
      private function _aq(param1:XML, param2:Class) : void
      {
         var constructorNode:XML = param1;
         var clazz:Class = param2;
         try
         {
            switch(constructorNode.children().length())
            {
               case 0:
                  new clazz();
                  break;
               case 1:
                  new clazz(null);
                  break;
               case 2:
                  new clazz(null,null);
                  break;
               case 3:
                  new clazz(null,null,null);
                  break;
               case 4:
                  new clazz(null,null,null,null);
                  break;
               case 5:
                  new clazz(null,null,null,null,null);
                  break;
               case 6:
                  new clazz(null,null,null,null,null,null);
                  break;
               case 7:
                  new clazz(null,null,null,null,null,null,null);
                  break;
               case 8:
                  new clazz(null,null,null,null,null,null,null,null);
                  break;
               case 9:
                  new clazz(null,null,null,null,null,null,null,null,null);
                  break;
               case 10:
                  new clazz(null,null,null,null,null,null,null,null,null,null);
            }
         }
         catch(error:Error)
         {
         }
         constructorNode.setChildren(describeType(clazz).factory.constructor[0].children());
      }
   }
}
