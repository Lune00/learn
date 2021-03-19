(ns clojure-noob.core
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "I'm a little teapot"))

(defn my-inc-maker 
  "Create a custom incrementor"
  [inc-by]
  #(+ % inc-by))
  

(def incBy2 (my-inc-maker 5))


(incBy2 1)


(def asym-hobbit-body-parts  [{:name "head" :size 3}
                              {:name "left-eye" :size 1}
                              {:name "left-ear" :size 1}
                              {:name "mouth" :size 1}])            
                              
                             