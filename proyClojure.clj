(def lst_i_1 (vector))
(def lst_i_0 (vector))
(def lst_e_1 (vector))
(def lst_e_0 (vector))
(def lst_s_1 (vector))
(def lst_s_0 (vector))
(def lrea_i (vector))
(def lrea_e (vector))
(def lrea_s (vector))
(defn add_task
[nu nu2 nu3]
(cond
(= nu 0)(if (= nu2 1) (def lst_i_1 (conj lst_i_1 nu3)) (def lst_i_0(conj lst_i_0 nu3)))
(= nu 1) (if (= nu2 1) (def lst_e_1 (conj lst_e_1 nu3)) (def lst_e_0(conj lst_e_0 nu3)))
:else (if (= nu2 1) (def lst_s_1 (conj lst_s_1 nu3)) (def lst_s_0(conj lst_s_0 nu3)))))
(while (= 5 5)
      (do
         (add_task (rand-int 3) (rand-int 2) (+ (rand-int 9) 1))
          (str "Tareas encoladas de Impresion "
               (into [] (concat lst_i_1 lst_i_0)))
          (str "Tareas encoladas de Email "
               (into [] (concat lst_e_1 lst_e_0)))
          (str "Tareas encoladas de E/S "
               (into [] (concat lst_s_1 lst_s_0)))
          (Thread/sleep 1000)
         )
  )

